require 'spec_helper'
#include Warden::Test::Helpers
#Warden.test_mode!
#class ReservationsControllerTest < ActionController::TestCase
 
 #test "should get index" do 
  #  get :index
   # assert_response :success
  #end

#end
# include Warden::Test::Helpers
# include Devise::TestHelpers
# Warden.test_mode!
# user = FactoryGirl.create(:user)
#   allow(request.env['warden']).to receive(:authenticate!) { user }
#   allow(controller).to receive(:current_user) { user }

  
# it "blocks unauthenticated access" do
#     sign_in nil

#     get :index

#     response.should redirect_to(new_user_session_path)
#   end

#   it "allows authenticated access" do
#     sign_in

#     get :index

#     response.should be_success
#   end

# describe "GET 'index'" do
#     it "returns http success" do
#       get 'index'
#       response.should be_success
#     end
#   end
describe ReservationsController do
# it  "should test_create"
#     # Simulate a POST response with the given HTTP parameters.
#     post(:create, reservation: { pickup_location: "mumbai", pickup_time: Time.now, dropoff_time: Time.now })

#     # Assert that the controller tried to redirect us to
#     # the created book's URI.
#     assert_response :found
# end
# describe ReservationsController do
#   it "should get index" do
#     get :index
#     assert_response :success
#     #assert_not_nil assigns(:reservation)
#   end

   
#   it "should get show" do
#     post :show
#     assert_response :success
#     #assert_not_nil assigns(:reservation)
#   end
# end
login_user
it "should have a current_user" do
    subject.current_user.should_not be_nil
  end
 it "index action should work" do
      #login_user
      get :index
     # assert_response :success
      expect(response.status).to eq(200)
    end

it "show action should work" do
      
      @reservation = FactoryGirl.create(:reservation)
      get :show, {id: @reservation.id}
      expect(assigns(:reservation)).to eq(@reservation)
    end
it "New action should work" do
      #login_user
      get :new
      expect(assigns(:reservation)).to be_a_new(Reservation)
    end
it "edit link should work" do
      @reservation = FactoryGirl.create(:reservation)
      get :edit, {id: @reservation.id}
      expect(assigns(:reservation)).to eq(@reservation)
    end
it "creates a new Reservation" do
        #login_user
        @reservation = FactoryGirl.create(:reservation)
        expect {post :create, {reservation: @reservation.attributes}}.to change(Reservation, :count).by(1)
      end  
it "assigns a newly created reservation as @Reservation" do
        #login_user
        @reservation = FactoryGirl.create(:reservation)
        post :create, {reservation: @reservation.attributes}
        expect(@reservation).to be_a(Reservation)
        expect(@reservation).to be_persisted
      end  
it "destroys the requested reservation" do
      #login_user
      @reservation = FactoryGirl.create(:reservation)
      get :show, {id: @reservation.id}
      if subject.current_user==@reservation.user
        expect {
          delete :destroy, {id: @reservation.id}
        }.to change(Reservation, :count).by(-1)
      end
    end
it "redirects to the reservations list after destroying" do
      #login_user
      @reservation = FactoryGirl.create(:reservation)
      delete :destroy, {id: @reservation.id}
      expect(response).to redirect_to(reservations_url)
    end
# it "edit link should redirect to the reservations" do
#       @reservation = FactoryGirl.create(:reservation)
#       get :edit, {id: @reservation.id}
#       expect(response).to redirect_to(reservations_url)
#     end
it "updates the requested reservation" do
        @reservation = FactoryGirl.create(:reservation)
        put :update, {id: @reservation.id, reservation: @reservation.attributes}
        @reservation.reload
      end
it "assigns the requested blog as @blog" do
        @reservation = FactoryGirl.create(:reservation)
        put :update, {id: @reservation.id, reservation: @reservation.attributes}
        expect(assigns(:reservation)).to eq(@reservation)
      end
it "redirects to the reservations after listing" do
        @reservation = FactoryGirl.create(:reservation)
        put :update, {id: @reservation.id, blog: @reservation.attributes}
        expect(response).to redirect_to(reservations_url)
      end
describe "with invalid params" do
      it "assigns the reservation as @reservation" do
        @reservation = FactoryGirl.create(:reservation)
        @reservation.pickup_location = nil
        put :update, {id: @reservation.id, reservation: @reservation.attributes}
        expect(assigns(:blog)).to eq(@blog)
      end    
end
# it "user should be able to edit own's reservation" do
#    @reservation = FactoryGirl.create(:reservation)
#     post :create, {reservation: @reservation.attributes}
#     get :edit, {id: @reservation.id}
#     expect(subject.current_user).to eq(@reservation.user)
#     end
end