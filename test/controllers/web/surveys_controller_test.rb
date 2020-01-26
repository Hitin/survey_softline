require 'test_helper'

class Web::SurveysControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get web_surveys_show_url
    assert_response :success
  end

end
