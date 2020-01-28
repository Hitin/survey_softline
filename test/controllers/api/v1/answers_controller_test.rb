require 'test_helper'

class Api::V1::AnswersControllerTest < ActionController::TestCase
  test "should get show" do
    author = create :user
    survey = create :survey, author: author
    question = create :question, author: author, survey: survey
    answer = create :answer, survey: survey, question: question
    get :show, params: { id: answer.id, format: :json }
    assert_response :success
  end

  test "should get index" do
    get :index, params: { format: :json }
    assert_response :success
  end

  test "should post create" do
    author = create :user
    survey = create :survey, author: author
    question = create :question, author: author, survey: survey
    answer = create :answer, survey: survey, question: question
    answer_attributes = attributes_for(:answer)
      .merge({ survey_id: survey.id, question_id: question.id })

    post :create, params: { answer: answer_attributes, format: :json }
    assert_response :created

    data = JSON.parse(response.body)
    created_answer = Answer.find(data['id'])

    assert created_answer.present?
    assert_equal answer_attributes.stringify_keys, created_answer.slice(*answer_attributes.keys)
  end

  test 'should put update' do
    author = create :user
    survey = create :survey, author: author
    question = create :question, author: author, survey: survey
    answer = create :answer, survey: survey, question: question
    answer_attributes = attributes_for(:answer)
      .merge({ survey_id: survey.id, question_id: question.id })

    patch :update, params: { id: answer.id, format: :json, answer: answer_attributes }
    assert_response :success

    answer.reload
    assert_equal answer.slice(*answer_attributes.keys), answer_attributes.stringify_keys
  end

  test 'should delete destroy' do
     author = create :user
    survey = create :survey, author: author
    question = create :question, author: author, survey: survey
    answer = create :answer, survey: survey, question: question
    
    delete :destroy, params: { id: answer.id, format: :json }
    assert_response :success

    assert !Answer.where(id: answer.id).exists?
  end

end
