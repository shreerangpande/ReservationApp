require 'test_helper'

include Warden::Test::Helpers
include Devise::TestHelpers
Warden.test_mode!

class ReservationsControllerTest < ActionController::TestCase
 
 test "should get index" do 
 	User.delete_all
    user = FactoryGirl.create(:user)
  allow(request.env['warden']).to receive(:authenticate!) { user }
  allow(controller).to receive(:current_user) { user }
	# user.save
	puts user.inspect 
    get :index
    assert_response :success
    Warden.test_reset!
  end

end
