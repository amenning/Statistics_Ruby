require './IndividualSeriesArithmeticRange'

describe IndividualSeriesArithmeticRange do
	before(:each) do
		@data_series = [6,2.1,3.7,4,1,6]
	end
	
	it "accepts an array of values upon initialization and provides the range" do
		test = IndividualSeriesArithmeticRange.new(@data_series)
		expect(test.range).not_to be_nil
		expect(test.range).to eq(5)
		expect(test.coefficient_of_range).to eq((5/7).to_f)
	end
	
	it "verifies that the data series is an array" do
		@data_series = "Test Failure"
		expect { IndividualSeriesArithmeticRange.new(@data_series) }.to raise_error(RangeError)
	end	
	
	it "verifies that the data series array is not an empty array" do
		@data_series = []
		expect { IndividualSeriesArithmeticRange.new(@data_series) }.to raise_error(RangeError)
	end

	it "verifies that all elements of the data series array is a number" do
		@data_series = [1,2,'A',4]
		expect { IndividualSeriesArithmeticRange.new(@data_series) }.to raise_error(RangeError)
	end		
end