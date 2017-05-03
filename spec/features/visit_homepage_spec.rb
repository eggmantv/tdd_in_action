require 'rails_helper'

feature "visit homepage" do
  scenario "should successfully" do
    visit root_path

    expect(page).to have_content 'hello world'
  end
end
