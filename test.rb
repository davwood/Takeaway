
require_relative './lib/takeaway.rb'

takeaway = Twilio::Takeaway.new({:Burger => 1.0, :Fries => 0.7}) 
takeaway.make_order({:Burger => 1},1)

print takeaway.order_totals_match?
print takeaway.expected_order_totals
print takeaway.order_totals

takeaway.send_text
