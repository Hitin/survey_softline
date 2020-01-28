require 'test_helper'

class Api::V1::QuestionsControllerTest < ActionController::TestCase
  test "should get show" do
    author = create :user
    survey = create :survey, author: author
    question = create :question, author: author, survey: survey
    get :show, params: { id: question.id, format: :json }
    assert_response :success
  end

  test "should get index" do
    get :index, params: { format: :json }
    assert_response :success
  end

  test "should post create" do
    author = create :user
    survey = create :survey, author: author
    sign_in(author)
    question_attributes = attributes_for(:question)
      .merge({ survey_id: survey.id })
    post :create, params: { question: question_attributes, format: :json }
    assert_response :created

    data = JSON.parse(response.body)
    created_question = Question.find(data['id'])

    question_attributes = question_attributes.merge({ author_id: author.id })

    assert created_question.present?
    assert_equal question_attributes.stringify_keys, created_question.slice(*question_attributes.keys)
  end

  test 'should put update' do
    author = create :user
    survey = create :survey, author: author
    sign_in(author)
    question = create :question, author: author, survey: survey
    question_attributes = attributes_for(:question)
      .merge({ survey_id: survey.id })

    patch :update, params: { id: question.id, format: :json, question: question_attributes }
    assert_response :success

    question_attributes = question_attributes.merge({ author_id: author.id })

    question.reload
    assert_equal question.slice(*question_attributes.keys), question_attributes.stringify_keys
  end

  test 'should delete destroy' do
    author = create :user
    survey = create :survey, author: author
    sign_in(author)
    question = create :question, author: author, survey: survey
    delete :destroy, params: { id: question.id, format: :json }
    assert_response :success

    assert !Question.where(id: question.id).exists?
  end

end
