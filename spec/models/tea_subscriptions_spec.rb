require 'rails_helper'

 RSpec.describe SubscriptionTea do
   describe 'Relationships' do
     it { should belong_to(:subscription) }
     it { should belong_to(:tea) }
   end
 end
