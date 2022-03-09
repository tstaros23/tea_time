class SubscriptionSerializer
  def self.format_single(subscription)
    {
      type: 'subscription',
      data: [
        {
          id: subscription.id,
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
         title: obj.title,
         price: obj.price,
         status: obj.status,
         frequency: obj.frequency
        }
      end
    }
  end
end
