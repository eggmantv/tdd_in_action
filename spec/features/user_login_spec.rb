require 'rails_helper'

feature 'user login' do
  scenario 'should open login page successfully' do
    visit new_session_path

    expect(page).to have_content "Please login"
  end

  scenario 'should login failed' do
    visit new_session_path

    within("form#login-form") do
      fill_in "username", with: "test_username"
      fill_in "password", with: "test_password"
      click_button "Login"
    end

    expect(page).to have_css "div.error"
  end

  scenario 'should login successfully' do
    create_user
    visit new_session_path

    within('form#login-form') do
      fill_in "username", with: 'test_username'
      fill_in "password", with: "test_password"
      click_button "Login"
    end

    expect(page).to have_current_path(todos_path)
  end
end
