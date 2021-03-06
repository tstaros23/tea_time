class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    subscriptions =customer.subscriptions
    render json: SubscriptionSerializer.format_multiple(subscriptions)
  end

  def create
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.new(subscription_params)
      if subscription.save
        render json: SubscriptionSerializer.format_single(subscription), status: :created
      else
        render json: {errors: {details: "Invalid subscription details"}}, status: :bad_request
      end
  end
  def update
    customer = Customer.find(params[:customer_id])
    if customer.present?
      subscription = customer.subscriptions.find_by(id: params[:id])
      if subscription.status == 'Active'
        subscription.update(status: 1)
      end
      render json: SubscriptionSerializer.format_single(subscription), status: :ok
    else
      render json: {errors: {details: "Customer doesnt exist"}}, status: :not_found
    end
  end

  private

    def subscription_params
      params.permit(:title, :price, :status, :frequency)
    end
end
