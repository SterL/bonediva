require 'minitest/helpers'

describe "User" do
  @user = User.new{ name: "Tom", username: "The tester", email: "Test@testr.com", password: "password", age: "22" }
  @user.valid?
end
