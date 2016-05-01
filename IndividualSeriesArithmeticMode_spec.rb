require './IndividualSeriesArithmeticMode'

describe IndividualSeriesArithmeticMode do
	before(:each) do
		@data_series = [6,2.1,3.7,4,1,6]
	end
	
	it "accepts an array of values upon initialization and provides the mode" do
		test = IndividualSeriesArithmeticMode.new(@data_series)
		expect(test.mode).not_to be_nil
		expect(test.mode).to eq([6])
	end
	
	it "accepts an array of values with multiple modes upon initialization and provides both modes" do
		@data_series = [6,5,6,2,4,4,7]
		test = IndividualSeriesArithmeticMode.new(@data_series)
		expect(test.mode).not_to be_nil
		expect(test.mode).to eq([4,6])
	end	
	
	it "verifies that the data series is an array" do
		@data_series = "Test Failure"
		expect { IndividualSeriesArithmeticMode.new(@data_series) }.to raise_error(RangeError)
	end	
	
	it "verifies that the data series array is not an empty array" do
		@data_series = []
		expect { IndividualSeriesArithmeticMode.new(@data_series) }.to raise_error(RangeError)
	end

	it "verifies that all elements of the data series array is a number" do
		@data_series = [1,2,'A',4]
		expect { IndividualSeriesArithmeticMode.new(@data_series) }.to raise_error(RangeError)
	end		
end