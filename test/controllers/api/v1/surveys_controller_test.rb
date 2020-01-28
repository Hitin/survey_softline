require 'test_helper'

class Api::V1::SurveysControllerTest < ActionController::TestCase
  test "should get show" do
    author = create :user
    survey = create :survey, author: author
    get :show, params: { id: survey.id, format: :json }
    assert_response :success
  end

  test "should get index" do
    get :index, params: { format: :json }
    assert_response :success
  end

  test "should post create" do
    author = create :user
    sign_in(author)
    survey_attributes = attributes_for(:survey)
    post :create, params: { survey: survey_attributes, format: :json }
    assert_response :created

    data = JSON.parse(response.body)
    created_survey = Survey.find(data['id'])

    survey_attributes = survey_attributes.merge({ author_id: author.id })

    assert created_survey.present?
    assert_equal survey_attributes.stringify_keys, created_survey.slice(*survey_attributes.keys)
  end

  test 'should put update' do
    author = create :user
    sign_in(author)
    survey = create :survey, author: author
    survey_attributes = attributes_for(:survey)

    patch :update, params: { id: survey.id, format: :json, survey: survey_attributes }
    assert_response :success

    survey_attributes = survey_attributes.merge({ author_id: author.id })

    survey.reload
    assert_equal survey.slice(*survey_attributes.keys), survey_attributes.stringify_keys
  end

  test 'should delete destroy' do
    author = create :user
    sign_in(author)
    survey = create :survey, author: author
    delete :destroy, params: { id: survey.id, format: :json }
    assert_response :success

    assert !Survey.where(id: survey.id).exists?
  end

end
