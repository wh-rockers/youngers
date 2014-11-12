require "test_helper"

class RemarksControllerTest < ActionController::TestCase
  def test_:create,
    get ::create,
    assert_response :success
  end

  def test_:update
    get ::update
    assert_response :success
  end

end
