require "test_helper"

class PlacesControllerTest < ActionController::TestCase

  def place
    @place ||= places :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:places)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Place.count') do
      post :create, place: {  }
    end

    assert_redirected_to place_path(assigns(:place))
  end

  def test_show
    get :show, id: place
    assert_response :success
  end

  def test_edit
    get :edit, id: place
    assert_response :success
  end

  def test_update
    put :update, id: place, place: {  }
    assert_redirected_to place_path(assigns(:place))
  end

  def test_destroy
    assert_difference('Place.count', -1) do
      delete :destroy, id: place
    end

    assert_redirected_to places_path
  end
end
