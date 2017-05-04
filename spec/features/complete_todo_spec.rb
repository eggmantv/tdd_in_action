require 'rails_helper'

feature 'complete todo' do
  background do
    @user = create_user
    login_user @user

    @todo_1 = @user.todos.create(title: 'my first todo')
  end

  scenario 'todo should be in incomplete' do
    visit todos_path

    expect(page).to have_css "li#todo-#{@todo_1.id} span.incomplete"
    expect(find("li#todo-#{@todo_1.id}")).to have_link "设为已完成"
  end

  scenario "todo should be in complete" do
    visit todos_path

    within("li#todo-#{@todo_1.id}") do
      click_link "设为已完成"
    end

    expect(page).to have_css "li#todo-#{@todo_1.id} span.complete"
    expect(find("li#todo-#{@todo_1.id}")).to have_link "设为未完成"
  end
end
