require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(username: "Yolo", email: "yolo@gmail.com")
	end

	test "should be valid" do 
		assert @user.valid?
	end

	test "username should be present" do
		@user.username = "   "
		assert_not @user.valid?
	end

	test "username should not be too long" do
		@user.username = "a" * 21
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email = "    "
		assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "a" * 256
	end

	test "username should be unique" do
		duplicate_user = @user.dup
		duplicate_user.username = @user.username.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

	test "email address should be unique" do
		duplicate_user = @user.dup 
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

	test "email address should be valid" do
		@user.email = "nom.nom.yahoo@com"
		assert_not @user.valid?
	end
end
