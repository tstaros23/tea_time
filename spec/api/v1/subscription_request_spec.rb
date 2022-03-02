require 'rails_helper'

 RSpec.describe Api::V1::SubscriptionsController, type: :controller do
   describe 'Post /api/v1/customers' do
     it "should create a new subscription if given valid params" do
       customer = Customer.create!(first_name: 'Ted', last_name: 'Staros', email: 'tstaros23@gmail.com', address: '11 Revere Dr.')
       subscription_params = {
         customer_id: customer.id,
         title: 'Tea Monthly',
         price: 52,
         status: 'Activated',
         frequency: 'Monthly'
       }

       headers = {"CONTENT_TYPE" => "application/json"}

      post :create, params: subscription_params
      created_subscription = Subscription.last

      expect(response).to be_successful
      expect(response.status).to eq(201)
     end
   end
 end
