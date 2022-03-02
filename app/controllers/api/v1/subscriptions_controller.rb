class Api::V1::SubscriptionsController < ApplicationController
  def index
    subscriptions = Subscription.all
    render json: SubscriptionSerializer.format_multiple(subscriptions)
  end
  def create
    subscription = Subscription.new(subscription_params)
      if subscription.save
        render json: SubscriptionSerializer.format_single(subscription), status: :created
      else
        render json: {errors: {details: "Invalid subscription details"}}, status: :bad_request
      end
  end

  def destroy
    if Subscription.exists?(params[:id])
      subscription = Subscription.find(params[:id])
      subscription.destroy
      render json: SubscriptionSerializer.format_single(subscription), status: :ok
    else
      render json: {errors: {details: "Subscription doesn't exist"}}
    end
  end

  private

    def subscription_params
      params.permit(:title, :price, :status, :frequency, :customer_id)
    end
end
