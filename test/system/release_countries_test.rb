require "application_system_test_case"

class ReleaseCountriesTest < ApplicationSystemTestCase
  setup do
    @release_country = release_countries(:one)
  end

  test "visiting the index" do
    visit release_countries_url
    assert_selector "h1", text: "Release Countries"
  end

  test "creating a Release country" do
    visit release_countries_url
    click_on "New Release Country"

    fill_in "Code", with: @release_country.code
    fill_in "Name", with: @release_country.name
    click_on "Create Release country"

    assert_text "Release country was successfully created"
    click_on "Back"
  end

  test "updating a Release country" do
    visit release_countries_url
    click_on "Edit", match: :first

    fill_in "Code", with: @release_country.code
    fill_in "Name", with: @release_country.name
    click_on "Update Release country"

    assert_text "Release country was successfully updated"
    click_on "Back"
  end

  test "destroying a Release country" do
    visit release_countries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Release country was successfully destroyed"
  end
end
