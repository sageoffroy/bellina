require "application_system_test_case"

class WayPaysTest < ApplicationSystemTestCase
  setup do
    @way_pay = way_pays(:one)
  end

  test "visiting the index" do
    visit way_pays_url
    assert_selector "h1", text: "Way Pays"
  end

  test "creating a Way pay" do
    visit way_pays_url
    click_on "New Way Pay"

    fill_in "C1", with: @way_pay.c1
    fill_in "C10", with: @way_pay.c10
    fill_in "C11", with: @way_pay.c11
    fill_in "C12", with: @way_pay.c12
    fill_in "C13", with: @way_pay.c13
    fill_in "C14", with: @way_pay.c14
    fill_in "C15", with: @way_pay.c15
    fill_in "C16", with: @way_pay.c16
    fill_in "C17", with: @way_pay.c17
    fill_in "C18", with: @way_pay.c18
    fill_in "C2", with: @way_pay.c2
    fill_in "C3", with: @way_pay.c3
    fill_in "C4", with: @way_pay.c4
    fill_in "C5", with: @way_pay.c5
    fill_in "C6", with: @way_pay.c6
    fill_in "C7", with: @way_pay.c7
    fill_in "C8", with: @way_pay.c8
    fill_in "C9", with: @way_pay.c9
    fill_in "Name", with: @way_pay.name
    click_on "Create Way pay"

    assert_text "Way pay was successfully created"
    click_on "Back"
  end

  test "updating a Way pay" do
    visit way_pays_url
    click_on "Edit", match: :first

    fill_in "C1", with: @way_pay.c1
    fill_in "C10", with: @way_pay.c10
    fill_in "C11", with: @way_pay.c11
    fill_in "C12", with: @way_pay.c12
    fill_in "C13", with: @way_pay.c13
    fill_in "C14", with: @way_pay.c14
    fill_in "C15", with: @way_pay.c15
    fill_in "C16", with: @way_pay.c16
    fill_in "C17", with: @way_pay.c17
    fill_in "C18", with: @way_pay.c18
    fill_in "C2", with: @way_pay.c2
    fill_in "C3", with: @way_pay.c3
    fill_in "C4", with: @way_pay.c4
    fill_in "C5", with: @way_pay.c5
    fill_in "C6", with: @way_pay.c6
    fill_in "C7", with: @way_pay.c7
    fill_in "C8", with: @way_pay.c8
    fill_in "C9", with: @way_pay.c9
    fill_in "Name", with: @way_pay.name
    click_on "Update Way pay"

    assert_text "Way pay was successfully updated"
    click_on "Back"
  end

  test "destroying a Way pay" do
    visit way_pays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Way pay was successfully destroyed"
  end
end
