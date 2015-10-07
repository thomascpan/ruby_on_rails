require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def setup
		@post = Post.new(title: "Banana Post!", body: "This is a Banana Post!")
	end

	test "should be valid" do 
		assert @post.valid?
	end

	test "title should be present" do 
		@post.title = "   "
		assert_not @post.valid?
	end

	test "body should be present" do
		@post.body = "    "
		assert_not @post.valid?
	end
end
