require 'test_helper'

class Web::SurveysControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get surveys_url
    assert_response :success
  end

end
