require_relative '../lib/takeaway.rb'

describe Takeaway do 

	it 'contain a list of dishes with prices' do
		takeaway = Takeaway.new({:Burger => 1.0, :Fries => 0.7}) 
		expect(takeaway.dishes).to eq({:Burger => 1.0, :Fries => 0.7})
	end

	it 'can receive an order' do
		takeaway = Takeaway.new({:Burger => 1.0, :Fries => 0.7}) 
		takeaway.make_order({:Burger => 1},1)
		expect(takeaway.orders).to eq([{:Burger => 1}])
	end

	it 'can total an order' do
		takeaway = Takeaway.new({:Burger => 1.0, :Fries => 0.7}) 
		takeaway.make_order({:Burger => 1},1)
		expect(takeaway.order_totals).to eq([1])
	end

	it 'can compare expected totals with actual totals' do
		takeaway = Takeaway.new({:Burger => 1.0, :Fries => 0.7}) 
		takeaway.make_order({:Burger => 1},2)
		expect(takeaway.order_totals_match?).to be_false
	end


end