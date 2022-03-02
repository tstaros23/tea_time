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

  def self.format_multiple(subscriptions)
    {
      type: 'subscription',
      data:
      subscriptions.map do |obj|
        {id: obj.id,
         customer_id: obj.customer_id,
         title: obj.title,
         price: obj.price,
         status: obj.status,
         frequency: obj.frequency
        }
      end
    }
  end
end
