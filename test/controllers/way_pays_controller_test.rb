require 'test_helper'

class WayPaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @way_pay = way_pays(:one)
  end

  test "should get index" do
    get way_pays_url
    assert_response :success
  end

  test "should get new" do
    get new_way_pay_url
    assert_response :success
  end

  test "should create way_pay" do
    assert_difference('WayPay.count') do
      post way_pays_url, params: { way_pay: { c1: @way_pay.c1, c10: @way_pay.c10, c11: @way_pay.c11, c12: @way_pay.c12, c13: @way_pay.c13, c14: @way_pay.c14, c15: @way_pay.c15, c16: @way_pay.c16, c17: @way_pay.c17, c18: @way_pay.c18, c2: @way_pay.c2, c3: @way_pay.c3, c4: @way_pay.c4, c5: @way_pay.c5, c6: @way_pay.c6, c7: @way_pay.c7, c8: @way_pay.c8, c9: @way_pay.c9, name: @way_pay.name } }
    end

    assert_redirected_to way_pay_url(WayPay.last)
  end

  test "should show way_pay" do
    get way_pay_url(@way_pay)
    assert_response :success
  end

  test "should get edit" do
    get edit_way_pay_url(@way_pay)
    assert_response :success
  end

  test "should update way_pay" do
    patch way_pay_url(@way_pay), params: { way_pay: { c1: @way_pay.c1, c10: @way_pay.c10, c11: @way_pay.c11, c12: @way_pay.c12, c13: @way_pay.c13, c14: @way_pay.c14, c15: @way_pay.c15, c16: @way_pay.c16, c17: @way_pay.c17, c18: @way_pay.c18, c2: @way_pay.c2, c3: @way_pay.c3, c4: @way_pay.c4, c5: @way_pay.c5, c6: @way_pay.c6, c7: @way_pay.c7, c8: @way_pay.c8, c9: @way_pay.c9, name: @way_pay.name } }
    assert_redirected_to way_pay_url(@way_pay)
  end

  test "should destroy way_pay" do
    assert_difference('WayPay.count', -1) do
      delete way_pay_url(@way_pay)
    end

    assert_redirected_to way_pays_url
  end
end
