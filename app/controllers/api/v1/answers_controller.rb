class Api::V1::AnswersController < Api::V1::ApplicationController
  def index
    q_params = params[:q] || { s: 'id asc' }

    answers = Answer.all
      .ransack(q_params)
      .result
      .page(params[:page])
      .per(params[:per_page])
      .includes(:survey, :question)


    json = {
        items: answers.map { |a| AnswerSerializer.new(a).as_json },
        meta: build_meta_surveys(answers)
    }

    respond_with json
  end

  def show
    answer = Answer.find(params[:id])
    respond_with(answer)
  end

  def create
    answer = Answer.new(answer_params)

    if answer.save
      respond_with(answer, location: nil)
    else
      render(json: { errors: answer.errors.messages }, status: :unprocessable_entity)
    end
  end

  def update
    answer = Answer.find(params[:id])

    if answer.update(answer_params)
      render(json: answer)
    else
      render(json: { errors: answer.errors.messages }, status: :unprocessable_entity)
    end
  end

  def destroy
    answer = Answer.find(params[:id])

    if answer.destroy
      head(:ok)
    else
      render(json: { errors: answer.errors.messages }, status: :unprocessable_entity)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :survey_id, :question_id)
  end

end
