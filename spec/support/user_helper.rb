module UserHelper

  def create_user opts = {}
    User.create({username: 'test_username', password: 'test_password'}.merge(opts))
  end

  def login_user user
    page.set_rack_session(user_id: user.id)
  end

end
