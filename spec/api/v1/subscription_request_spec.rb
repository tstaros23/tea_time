require 'rails_helper'

 RSpec.describe Api::V1::SubscriptionsController, type: :controller do
   describe 'POST /api/v1/subscriptions' do
     it "should create a new subscription if given valid params" do
       customer = Customer.create!(first_name: 'Ted', last_name: 'Staros', email: 'tstaros23@gmail.com', address: '11 Revere Dr.')
       subscription_params = {
         customer_id: customer.id,
         title: 'Tea Monthly',
         price: 52,
         status: 'Active',
         frequency: 'Monthly'
       }

       headers = {"CONTENT_TYPE" => "application/json"}

      post :create, params: subscription_params
      created_subscription = Subscription.last

      expect(response.status).to eq(201)
     end
   end

   describe 'GET /api/v1/subscriptions' do
     it "should get a list of subscriptions" do
       customer = Customer.create!(first_name: 'Ted', last_name: 'Staros', email: 'tstaros23@gmail.com', address: '11 Revere Dr.')
       subscription = Subscription.create!(customer_id: customer.id, title: 'Tea Monthly', price: 52, status: 'Active', frequency: 'Monthly' )
       subscription2 = Subscription.create!(customer_id: customer.id, title: 'Tea weekly', price: 46, status: 'Active', frequency: 'Weekly' )
       subscription3 = Subscription.create!(customer_id: customer.id, title: 'Tea Monthly', price: 54, status: 'Cancelled', frequency: 'Monthly' )

       get :index

       expect(response).to be_successful
       expect(response.status).to eq(200)
     end
   end

   describe 'PATCH /api/v1/subscriptions/:id' do
     it "should update a subscription to cancelled" do

       customer = Customer.create!(first_name: 'Ted', last_name: 'Staros', email: 'tstaros23@gmail.com', address: '11 Revere Dr.')
       subscription = Subscription.create!(customer_id: customer.id, title: 'Tea Monthly', price: 52, status: 'Active', frequency: 'Monthly' )

       expect(subscription.status).to_not eq('Cancelled')

       patch :update, params: { id: subscription.id}

       expect(response).to be_successful
       expect(response.status).to eq(200)

       json_subscription = JSON.parse(response.body, symbolize_names: true)

       expect(json_subscription[:data][0][:status]).to eq("Cancelled")
     end
   end
 end
