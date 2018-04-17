class UserSubscription < ApplicationRecord
	belongs_to :user
	belongs_to :subscription
	validate :check_numbers

	def check_numbers
		if self.subscription != nil

			if self.subscription.price < 10
				if self.subscription.user_subscriptions.where(role: "teacher").count >= 2 
					self.errors[:base] << "You cant do that"
				end 
				
				if self.subscription.user_subscriptions.where(role: "student").count >= 5
					self.errors[:base] << "You cant do that"
				end			
			end
		end
	end
end
