require "application_system_test_case"

class HuntersTest < ApplicationSystemTestCase
  setup do
    @hunter = hunters(:one)
  end

  test "visiting the index" do
    visit hunters_url
    assert_selector "h1", text: "Hunters"
  end

  test "creating a Hunter" do
    visit hunters_url
    click_on "New Hunter"

    fill_in "Charm", with: @hunter.charm
    fill_in "Cool", with: @hunter.cool
    fill_in "Experience", with: @hunter.experience
    fill_in "Harm", with: @hunter.harm
    fill_in "Luck", with: @hunter.luck
    fill_in "Name", with: @hunter.name
    fill_in "Sharp", with: @hunter.sharp
    fill_in "Tough", with: @hunter.tough
    fill_in "Weird", with: @hunter.weird
    click_on "Create Hunter"

    assert_text "Hunter was successfully created"
    click_on "Back"
  end

  test "updating a Hunter" do
    visit hunters_url
    click_on "Edit", match: :first

    fill_in "Charm", with: @hunter.charm
    fill_in "Cool", with: @hunter.cool
    fill_in "Experience", with: @hunter.experience
    fill_in "Harm", with: @hunter.harm
    fill_in "Luck", with: @hunter.luck
    fill_in "Name", with: @hunter.name
    fill_in "Sharp", with: @hunter.sharp
    fill_in "Tough", with: @hunter.tough
    fill_in "Weird", with: @hunter.weird
    click_on "Update Hunter"

    assert_text "Hunter was successfully updated"
    click_on "Back"
  end

  test "destroying a Hunter" do
    visit hunters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hunter was successfully destroyed"
  end
end
