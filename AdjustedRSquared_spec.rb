require './AdjustedRSquared'

describe AdjustedRSquared do
	before(:each) do
		@r_square = 0.9
		@data_size = 50
		@num_regression_coefficients = 5
	end
	
	it "accepts three numbers upon initialization and provides adjusted r square" do
		test = AdjustedRSquared.new(@r_square,@data_size,@num_regression_coefficients)
		expect(test.adjusted_r_square).not_to be_nil
	end
	
	it "verifies that the data size is greater than the number of regression coefficients" do
		@data_size = 1
		expect { AdjustedRSquared.new(@r_square,@data_size,@num_regression_coefficients) }.to raise_error(RangeError)
	end

	it "verifies that r_square is between 0 and 1" do
		@r_square = 1.9
		expect { AdjustedRSquared.new(@r_square,@data_size,@num_regression_coefficients) }.to raise_error(RangeError)
	end
	
	it "verifies that input r_square is float or fixnum" do
		@r_square = "A"
		expect { AdjustedRSquared.new(@r_square,@data_size,@num_regression_coefficients) }.to raise_error(RangeError)
	end

	it "verifies that input data_size is fixnum or bignum" do
		@data_size = "A"
		expect { AdjustedRSquared.new(@r_square,@data_size,@num_regression_coefficients) }.to raise_error(RangeError)
	end

	it "verifies that input num_regression_coefficients is fixnum or bignum" do
		@num_regression_coefficients = "A"
		expect { AdjustedRSquared.new(@r_square,@data_size,@num_regression_coefficients) }.to raise_error(RangeError)
	end

	it "verifies that input num_regression_coefficients is greater than 0" do
		@num_regression_coefficients = 0
		expect { AdjustedRSquared.new(@r_square,@data_size,@num_regression_coefficients) }.to raise_error(RangeError)
	end		
end