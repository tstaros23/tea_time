class SubscriptionSerializer
  def self.format_single(subscription)
    {
      type: 'subscription',
      data: [
        {
          id: subscription.id,
          customer_id: subscription.customer_id,
          title: subscription.title,
          price: subscription.price,
          status: subscription.status,
          frequency: subscription.frequency
        }
      ]
    }
  end
end
