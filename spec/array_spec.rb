require_relative '../lib/array'

describe Array do

	it 'method inject should be able to sum an array' do
		a = [1,2,3,4,5].injector {|accumulator,n| accumulator + n}
		expect(a).to eq(15)
	end

	it 'method inject can use a block' do
		a = [1,2,3,4,5].injector do |accumulator,n|
			if accumulator > n then accumulator else n end
		end
		expect(a).to eq(5)
	end

	it 'can look at an empty array' do
		a = [].injector
		expect(a).to be_nil
	end

	it 'can iterate' do
		a = [1,2,3,4,5].injector {|n| n * 2} 
		expect(a).to eq([2,4,6,8,10])
	end

	it 'can use a symbol accumulator' do
		a = [1,2,3,4,5].injector(:+)
		expect(a).to eq(15)
	end

	it 'can use a symbol accumulator with an initial value' do
		a = [1,2,3,4,5].injector(3,:+)
		expect(a).to eq(18)
	end

end