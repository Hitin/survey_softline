class Api::V1::QuestionsController < Api::V1::ApplicationController
  def index
    q_params = params[:q] || { s: 'id asc' }

    questions = Question.all
      .ransack(q_params)
      .result
      .page(params[:page])
      .per(params[:per_page])
      .includes(:author, :survey)


    json = {
        items: questions.map { |q| QuestionSerializer.new(q).as_json },
        meta: build_meta_surveys(questions)
    }

    respond_with json
  end

  def show
    question = Question.find(params[:id])
    respond_with(question)
  end

  def create
    question = current_user.my_questions.new(question_params)

    if question.save
      respond_with(question, location: nil)
    else
      render(json: { errors: question.errors.messages }, status: :unprocessable_entity)
    end
  end

  def update
    question = current_user.my_questions.find(params[:id])
    
    if question.update(question_params)
      render(json: question)
    else
      render(json: { errors: question.errors.messages }, status: :unprocessable_entity)
    end
  end

  def destroy
    question = current_user.my_questions.find(params[:id])

    if question.destroy
      head(:ok)
    else
      render(json: { errors: question.errors.messages }, status: :unprocessable_entity)
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :position, :survey_id, :type_question, author_id: current_user.id)
  end

end
