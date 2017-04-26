require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.create(name: "Smith")
    @user.posts.create(name: "First post", text: "Text for first post")
  end

  test "The model should soft delete user record" do  	
  	assert @user.soft_delete
  	assert_equal 1, User.soft_deleted.count
  	assert_equal 1, @user.posts.soft_deleted.count
  end

  test "The model should really delete user record" do  	
  	assert @user.delete
  	assert_equal 0, User.soft_deleted.count
  	assert_equal 0, @user.posts.soft_deleted.count
  end

end
