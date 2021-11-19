require "test_helper"

class IpaddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ipaddress = ipaddresses(:one)
  end

  test "should get index" do
    get ipaddresses_url, as: :json
    assert_response :success
  end

  test "should create ipaddress" do
    assert_difference('Ipaddress.count') do
      post ipaddresses_url, params: { ipaddress: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show ipaddress" do
    get ipaddress_url(@ipaddress), as: :json
    assert_response :success
  end

  test "should update ipaddress" do
    patch ipaddress_url(@ipaddress), params: { ipaddress: {  } }, as: :json
    assert_response 200
  end

  test "should destroy ipaddress" do
    assert_difference('Ipaddress.count', -1) do
      delete ipaddress_url(@ipaddress), as: :json
    end

    assert_response 204
  end
end
