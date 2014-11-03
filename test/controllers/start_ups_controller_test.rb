require "test_helper"

class StartUpsControllerTest < ActionController::TestCase

  def start_up
    @start_up ||= start_ups :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:start_ups)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('StartUp.count') do
      post :create, start_up: { desc: @start_up.desc, likes_count: @start_up.likes_count, logo_url: @start_up.logo_url, name: @start_up.name }
    end

    assert_redirected_to start_up_path(assigns(:start_up))
  end

  def test_show
    get :show, id: start_up
    assert_response :success
  end

  def test_edit
    get :edit, id: start_up
    assert_response :success
  end

  def test_update
    put :update, id: start_up, start_up: { desc: @start_up.desc, likes_count: @start_up.likes_count, logo_url: @start_up.logo_url, name: @start_up.name }
    assert_redirected_to start_up_path(assigns(:start_up))
  end

  def test_destroy
    assert_difference('StartUp.count', -1) do
      delete :destroy, id: start_up
    end

    assert_redirected_to start_ups_path
  end
end
