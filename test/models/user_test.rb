require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
       @user = User.new(first_name: "Quan", 
       last_name: "Tran", 
       email: "abc@xyz.com", 
       phone_work: "2811234567", 
       institution: "UofH", 
       status_id: 1)
    end
   
   
   test "user should be valid" do
       assert @user.valid?
   end
   test "missing name" do
       @user.first_name = " "
       assert_not @user.valid?
   end
end
