require 'test_helper'

class Public::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_cart_products_show_url
    assert_response :success
  end

  test "should get update" do
    get public_cart_products_update_url
    assert_response :success
  end

  test "should get clear" do
    get public_cart_products_clear_url
    assert_response :success
  end

  test "should get destroy" do
    get public_cart_products_destroy_url
    assert_response :success
  end

  test "should get add_products" do
    get public_cart_products_add_products_url
    assert_response :success
  end

end
