require './AdjustedRSquared'

describe AdjustedRSquared do
	it "accepts three numbers upon initialization and provides adjusted r square" do
		test = AdjustedRSquared.new(1,2,1)
		expect(test.adjusted_r_square).not_to be_nil
	end
	
	# it "verifies that the data size is greater than the number of regression coefficients" do
		# test = AdjustedRSquared.new(1,1,1)
		# expect(test.adjusted_r_square).not_to be_nil
	# end

end