require 'test_helper'

class FootwearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @footwear = footwears(:one)
  end

  test "should get index" do
    get footwears_url
    assert_response :success
  end

  test "should get new" do
    get new_footwear_url
    assert_response :success
  end

  test "should create footwear" do
    assert_difference('Footwear.count') do
      post footwears_url, params: { footwear: { active: @footwear.active, category_id: @footwear.category_id, color_id: @footwear.color_id, gender: @footwear.gender, long_description: @footwear.long_description, release_country_id: @footwear.release_country_id, release_date: @footwear.release_date, retail_price: @footwear.retail_price, season_id: @footwear.season_id, short_description: @footwear.short_description, size_id: @footwear.size_id, sku: @footwear.sku, stock: @footwear.stock, stock_warning: @footwear.stock_warning, trademark_id: @footwear.trademark_id, weight: @footwear.weight, wholesale_price: @footwear.wholesale_price } }
    end

    assert_redirected_to footwear_url(Footwear.last)
  end

  test "should show footwear" do
    get footwear_url(@footwear)
    assert_response :success
  end

  test "should get edit" do
    get edit_footwear_url(@footwear)
    assert_response :success
  end

  test "should update footwear" do
    patch footwear_url(@footwear), params: { footwear: { active: @footwear.active, category_id: @footwear.category_id, color_id: @footwear.color_id, gender: @footwear.gender, long_description: @footwear.long_description, release_country_id: @footwear.release_country_id, release_date: @footwear.release_date, retail_price: @footwear.retail_price, season_id: @footwear.season_id, short_description: @footwear.short_description, size_id: @footwear.size_id, sku: @footwear.sku, stock: @footwear.stock, stock_warning: @footwear.stock_warning, trademark_id: @footwear.trademark_id, weight: @footwear.weight, wholesale_price: @footwear.wholesale_price } }
    assert_redirected_to footwear_url(@footwear)
  end

  test "should destroy footwear" do
    assert_difference('Footwear.count', -1) do
      delete footwear_url(@footwear)
    end

    assert_redirected_to footwears_url
  end
end
