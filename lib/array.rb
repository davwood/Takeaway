class Array

	def injector
		sum = self.shift
		self.each do |value| sum = yield(sum,value)
		end
		sum
	end

	# def iterate!
	#     self.each_with_index do |n, i|
	#       self[i] = yield(n)

	#     end
	# end

	# def injecting
	# 	self.each_index do |index|
	# 		@result = self[index] if index < 1
	# 		@result += self[index] if index > 0
	# 		puts self[index]
	# 	end
	# 	@result
	# end

end


