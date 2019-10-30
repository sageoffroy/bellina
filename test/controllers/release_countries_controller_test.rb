require 'test_helper'

class ReleaseCountriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @release_country = release_countries(:one)
  end

  test "should get index" do
    get release_countries_url
    assert_response :success
  end

  test "should get new" do
    get new_release_country_url
    assert_response :success
  end

  test "should create release_country" do
    assert_difference('ReleaseCountry.count') do
      post release_countries_url, params: { release_country: { code: @release_country.code, name: @release_country.name } }
    end

    assert_redirected_to release_country_url(ReleaseCountry.last)
  end

  test "should show release_country" do
    get release_country_url(@release_country)
    assert_response :success
  end

  test "should get edit" do
    get edit_release_country_url(@release_country)
    assert_response :success
  end

  test "should update release_country" do
    patch release_country_url(@release_country), params: { release_country: { code: @release_country.code, name: @release_country.name } }
    assert_redirected_to release_country_url(@release_country)
  end

  test "should destroy release_country" do
    assert_difference('ReleaseCountry.count', -1) do
      delete release_country_url(@release_country)
    end

    assert_redirected_to release_countries_url
  end
end
