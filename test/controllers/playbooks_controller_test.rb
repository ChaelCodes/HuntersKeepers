# frozen_string_literal: true

require 'test_helper'

class PlaybooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @playbook = playbooks(:one)
  end

  test 'should get index' do
    get playbooks_url
    assert_response :success
  end

  test 'should get new' do
    get new_playbook_url
    assert_response :success
  end

  test 'should create playbook' do
    assert_difference('Playbook.count') do
      post playbooks_url, params: { playbook: { description: @playbook.description, name: @playbook.name } }
    end

    assert_redirected_to playbook_url(Playbook.last)
  end

  test 'should show playbook' do
    get playbook_url(@playbook)
    assert_response :success
  end

  test 'should get edit' do
    get edit_playbook_url(@playbook)
    assert_response :success
  end

  test 'should update playbook' do
    patch playbook_url(@playbook), params: { playbook: { description: @playbook.description, name: @playbook.name } }
    assert_redirected_to playbook_url(@playbook)
  end

  test 'should destroy playbook' do
    assert_difference('Playbook.count', -1) do
      delete playbook_url(@playbook)
    end

    assert_redirected_to playbooks_url
  end
end
