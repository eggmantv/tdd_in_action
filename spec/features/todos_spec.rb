require 'rails_helper'

feature 'todos' do
  scenario "visit todos page should successfully" do
    visit todos_path

    expect(page).to have_css 'h1', text: 'Todos list'
    expect(page).to have_css 'a', text: 'Create a Todo'
  end

  feature 'new todo' do
    scenario "should open new page successfully" do
      visit new_todo_path

      expect(page).to have_content "Create a Todo"
    end

    scenario "should create todo successfully" do
      visit new_todo_path

      within('#todo-form') do
        fill_in 'todo[title]', with: 'My first todo'
        click_button 'Save'
      end

      expect(page).to have_current_path(todos_path)
      expect(page).to have_css 'ul li', text: 'My first todo'
    end
  end
end
