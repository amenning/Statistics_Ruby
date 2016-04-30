require './IndividualSeriesArithmeticMedian'

describe IndividualSeriesArithmeticMedian do
	before(:each) do
		@data_series = [6,2.1,3.7,4,1,6]
	end
	
	it "accepts an array of values of even length upon initialization and provides average" do
		test = IndividualSeriesArithmeticMedian.new(@data_series)
		expect(test.median).not_to be_nil
		expect(test.median).to eq(3.85)
	end
	
	it "accepts an array of values of odd length hupon initialization and provides average" do
		@data_series = [6,5,3,2,1,4,7]
		test = IndividualSeriesArithmeticMedian.new(@data_series)
		expect(test.median).not_to be_nil
		expect(test.median).to eq(4)
	end	
	
	it "verifies that the data series is an array" do
		@data_series = "Test Failure"
		expect { IndividualSeriesArithmeticMedian.new(@data_series) }.to raise_error(RangeError)
	end	
	
	it "verifies that the data series array is not an empty array" do
		@data_series = []
		expect { IndividualSeriesArithmeticMedian.new(@data_series) }.to raise_error(RangeError)
	end

	it "verifies that all elements of the data series array is a number" do
		@data_series = [1,2,'A',4]
		expect { IndividualSeriesArithmeticMedian.new(@data_series) }.to raise_error(RangeError)
	end		
end