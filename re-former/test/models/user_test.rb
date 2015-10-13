require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(username: "thomascpan", email: "thomascpan@gmail.com", password: "123456")
	end

	test "should be valid" do 
		assert @user.valid?
	end

	test "username should be present" do 
		@user.username = "    " 
		assert_not @user.valid?
	end

	test "username should not be too long" do 
		@user.username = "a" * 21
		assert_not @user.valid?
	end

	test "username should be unique" do 
		duplicate_user = @user.dup
		duplicate_user.username = @user.username.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

	test "email should be present" do 
		@user.email = "    " 
		assert_not @user.valid?
	end

	test "email should not be too long" do 
		@user.email = "a" * 244 + "@example.com"
		assert_not @user.valid?
	end

	test "email should be unique" do 
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end	

	test "password should be present" do 
		@user.password = "    "
		assert_not @user.valid?
	end

	test "password should not be too short" do 
		@user.password = "a" * 5
		assert_not @user.valid?
	end
end
