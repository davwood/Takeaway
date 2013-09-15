

module Twilio
require 'twilio-ruby'

account_sid = 'ACb769bb07fc3178bc8ab142c30373c41e'
auth_token = 'b73d11c67ea4afa668783076b2cfc4cb'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token


class Takeaway

	def initialize(list_w_prices)
		@dishes = list_w_prices
		@orders = []
		@expected_order_totals = []
		@order_totals = []
	end

	def dishes
		@dishes
	end

	def make_order(orders,total)
		@orders.push(orders)
		@order_totals.push(orders.values.inject(:+))
		@expected_order_totals.push(total)
	end

	def orders
		@orders
	end

	def expected_order_totals
		@expected_order_totals
	end

	def order_totals
		@order_totals
	end

	def order_totals_match?
		@order_totals == @expected_order_totals
	end

	def send_text
		if order_totals_match?
			@client.account.sms.messages.create(
		  	:from => '+441158243283',
		  	:to => '+447957027826',
		  	:body => 'Thank you! Your order was placed and will be delivered before 18:52.'
			) 
		end
	 
	end

end


end