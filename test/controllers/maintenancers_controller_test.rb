require 'test_helper'

class MaintenancersControllerTest < ActionController::TestCase
  setup do
    @maintenancer = maintenancers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintenancers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintenancer" do
    assert_difference('Maintenancer.count') do
      post :create, maintenancer: { name: @maintenancer.name }
    end

    assert_redirected_to maintenancer_path(assigns(:maintenancer))
  end

  test "should show maintenancer" do
    get :show, id: @maintenancer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maintenancer
    assert_response :success
  end

  test "should update maintenancer" do
    patch :update, id: @maintenancer, maintenancer: { name: @maintenancer.name }
    assert_redirected_to maintenancer_path(assigns(:maintenancer))
  end

  test "should destroy maintenancer" do
    assert_difference('Maintenancer.count', -1) do
      delete :destroy, id: @maintenancer
    end

    assert_redirected_to maintenancers_path
  end
end
