require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  setup do
    @device = devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device" do
    assert_difference('Device.count') do
      post :create, device: { asset_number: @device.asset_number, brand_id: @device.brand_id, commissioning: @device.commissioning, department_id: @device.department_id, dept1st: @device.dept1st, dept2nd: @device.dept2nd, dept3rd: @device.dept3rd, factory_number: @device.factory_number, fund_source: @device.fund_source, ip: @device.ip, location: @device.location, mac: @device.mac, model: @device.model, note: @device.note, os: @device.os, production_date: @device.production_date, serial: @device.serial, type_id: @device.type_id, user: @device.user, user_phone: @device.user_phone, value: @device.value }
    end

    assert_redirected_to device_path(assigns(:device))
  end

  test "should show device" do
    get :show, id: @device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device
    assert_response :success
  end

  test "should update device" do
    patch :update, id: @device, device: { asset_number: @device.asset_number, brand_id: @device.brand_id, commissioning: @device.commissioning, department_id: @device.department_id, dept1st: @device.dept1st, dept2nd: @device.dept2nd, dept3rd: @device.dept3rd, factory_number: @device.factory_number, fund_source: @device.fund_source, ip: @device.ip, location: @device.location, mac: @device.mac, model: @device.model, note: @device.note, os: @device.os, production_date: @device.production_date, serial: @device.serial, type_id: @device.type_id, user: @device.user, user_phone: @device.user_phone, value: @device.value }
    assert_redirected_to device_path(assigns(:device))
  end

  test "should destroy device" do
    assert_difference('Device.count', -1) do
      delete :destroy, id: @device
    end

    assert_redirected_to devices_path
  end
end
