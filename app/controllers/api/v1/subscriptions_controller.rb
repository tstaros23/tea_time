class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(subscription_params)
      if subscription.save
        render json: SubscriptionSerializer.format_single(subscription), status: :created
      else
        render json: {errors: {details: "Invalid subscription details"}}, status: :bad_request
      end
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id)
  end
end
