require "application_system_test_case"

class PlaybooksTest < ApplicationSystemTestCase
  setup do
    @playbook = playbooks(:one)
  end

  test "visiting the index" do
    visit playbooks_url
    assert_selector "h1", text: "Playbooks"
  end

  test "creating a Playbook" do
    visit playbooks_url
    click_on "New Playbook"

    fill_in "Description", with: @playbook.description
    fill_in "Name", with: @playbook.name
    click_on "Create Playbook"

    assert_text "Playbook was successfully created"
    click_on "Back"
  end

  test "updating a Playbook" do
    visit playbooks_url
    click_on "Edit", match: :first

    fill_in "Description", with: @playbook.description
    fill_in "Name", with: @playbook.name
    click_on "Update Playbook"

    assert_text "Playbook was successfully updated"
    click_on "Back"
  end

  test "destroying a Playbook" do
    visit playbooks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Playbook was successfully destroyed"
  end
end
