require "test_helper"

class StartUpsControllerTest < ActionController::TestCase

  def test_create
    assert_difference('StartUp.count') do
      post :create, start_up: { desc: "start up's desc", logo_url: "start up's logo", name: "milier"}
    end
    assert_response :success
    assert_includes response.body, 'milier'
  end

  test "should not pass if required attr is empty" do
    post :create, start_up: { desc: "start up's desc", name: "milier"}
    assert_response :success
    refute_includes response.body, 'milier'
  end
end
