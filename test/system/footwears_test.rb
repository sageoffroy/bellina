require "application_system_test_case"

class FootwearsTest < ApplicationSystemTestCase
  setup do
    @footwear = footwears(:one)
  end

  test "visiting the index" do
    visit footwears_url
    assert_selector "h1", text: "Footwears"
  end

  test "creating a Footwear" do
    visit footwears_url
    click_on "New Footwear"

    check "Active" if @footwear.active
    fill_in "Category", with: @footwear.category_id
    fill_in "Color", with: @footwear.color_id
    fill_in "Gender", with: @footwear.gender
    fill_in "Long description", with: @footwear.long_description
    fill_in "Release country", with: @footwear.release_country_id
    fill_in "Release date", with: @footwear.release_date
    fill_in "Retail price", with: @footwear.retail_price
    fill_in "Season", with: @footwear.season_id
    fill_in "Short description", with: @footwear.short_description
    fill_in "Size", with: @footwear.size_id
    fill_in "Sku", with: @footwear.sku
    fill_in "Stock", with: @footwear.stock
    fill_in "Stock warning", with: @footwear.stock_warning
    fill_in "Trademark", with: @footwear.trademark_id
    fill_in "Weight", with: @footwear.weight
    fill_in "Wholesale price", with: @footwear.wholesale_price
    click_on "Create Footwear"

    assert_text "Footwear was successfully created"
    click_on "Back"
  end

  test "updating a Footwear" do
    visit footwears_url
    click_on "Edit", match: :first

    check "Active" if @footwear.active
    fill_in "Category", with: @footwear.category_id
    fill_in "Color", with: @footwear.color_id
    fill_in "Gender", with: @footwear.gender
    fill_in "Long description", with: @footwear.long_description
    fill_in "Release country", with: @footwear.release_country_id
    fill_in "Release date", with: @footwear.release_date
    fill_in "Retail price", with: @footwear.retail_price
    fill_in "Season", with: @footwear.season_id
    fill_in "Short description", with: @footwear.short_description
    fill_in "Size", with: @footwear.size_id
    fill_in "Sku", with: @footwear.sku
    fill_in "Stock", with: @footwear.stock
    fill_in "Stock warning", with: @footwear.stock_warning
    fill_in "Trademark", with: @footwear.trademark_id
    fill_in "Weight", with: @footwear.weight
    fill_in "Wholesale price", with: @footwear.wholesale_price
    click_on "Update Footwear"

    assert_text "Footwear was successfully updated"
    click_on "Back"
  end

  test "destroying a Footwear" do
    visit footwears_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Footwear was successfully destroyed"
  end
end
