require "application_system_test_case"

class TrademarksTest < ApplicationSystemTestCase
  setup do
    @trademark = trademarks(:one)
  end

  test "visiting the index" do
    visit trademarks_url
    assert_selector "h1", text: "Trademarks"
  end

  test "creating a Trademark" do
    visit trademarks_url
    click_on "New Trademark"

    fill_in "Description", with: @trademark.description
    fill_in "Name", with: @trademark.name
    fill_in "Provider", with: @trademark.provider_id
    click_on "Create Trademark"

    assert_text "Trademark was successfully created"
    click_on "Back"
  end

  test "updating a Trademark" do
    visit trademarks_url
    click_on "Edit", match: :first

    fill_in "Description", with: @trademark.description
    fill_in "Name", with: @trademark.name
    fill_in "Provider", with: @trademark.provider_id
    click_on "Update Trademark"

    assert_text "Trademark was successfully updated"
    click_on "Back"
  end

  test "destroying a Trademark" do
    visit trademarks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trademark was successfully destroyed"
  end
end
