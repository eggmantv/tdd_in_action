module UserHelper

  def create_user opts = {}
    User.create({username: 'test_username', password: 'test_password'}.merge(opts))
  end

end
