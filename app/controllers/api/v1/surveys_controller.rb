class Api::V1::SurveysController < Api::V1::ApplicationController
  def index
    q_params = params[:q] || { s: 'id asc' }

    surveys = Survey.all
      .ransack(q_params)
      .result
      .page(params[:page])
      .per(params[:per_page])
      .includes(:author)


    json = {
        items: surveys.map { |s| SurveySerializer.new(s).as_json },
        meta: build_meta_surveys(surveys)
    }

    respond_with json
  end

  def show
    survey = Survey.find(params[:id])
    respond_with(survey)
  end

  def create
    survey = current_user.my_surveys.new(survey_params)

    if survey.save
      respond_with(survey, location: nil)
    else
      render(json: { errors: survey.errors.messages }, status: :unprocessable_entity)
    end
  end

  def update
    survey = current_user.my_surveys.find(params[:id])

    if survey.update(survey_params)
      render(json: survey)
    else
      render(json: { errors: survey.errors.messages }, status: :unprocessable_entity)
    end
  end

  def destroy
    survey = current_user.my_surveys.find(params[:id])

    if survey.destroy
      head(:ok)
    else
      render(json: { errors: survey.errors.messages }, status: :unprocessable_entity)
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, author_id: current_user.id)
  end

end
