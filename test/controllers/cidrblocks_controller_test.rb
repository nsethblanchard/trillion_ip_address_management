require "test_helper"

class CidrblocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cidrblock = cidrblocks(:one)
  end

  test "should get index" do
    get cidrblocks_url, as: :json
    assert_response :success
  end

  test "should create cidrblock" do
    assert_difference('Cidrblock.count') do
      post cidrblocks_url, params: { cidrblock: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show cidrblock" do
    get cidrblock_url(@cidrblock), as: :json
    assert_response :success
  end

  test "should update cidrblock" do
    patch cidrblock_url(@cidrblock), params: { cidrblock: {  } }, as: :json
    assert_response 200
  end

  test "should destroy cidrblock" do
    assert_difference('Cidrblock.count', -1) do
      delete cidrblock_url(@cidrblock), as: :json
    end

    assert_response 204
  end
end
