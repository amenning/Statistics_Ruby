require './IndividualSeriesArithmeticMean'

describe IndividualSeriesArithmeticMean do
	before(:each) do
		@data_series = [1,2,3,4,5,6]
	end
	
	it "accepts an array of values upon initialization and provides average" do
		test = IndividualSeriesArithmeticMean.new(@data_series)
		expect(test.average).not_to be_nil
		expect(test.average).to eq(3.5)
	end
	
	it "verifies that the data series is an array" do
		@data_series = "Test Failure"
		expect { IndividualSeriesArithmeticMean.new(@data_series) }.to raise_error(RangeError)
	end	
	
	it "verifies that the data series array is not an empty array" do
		@data_series = []
		expect { IndividualSeriesArithmeticMean.new(@data_series) }.to raise_error(RangeError)
	end

	it "verifies that all elements of the data series array is a number" do
		@data_series = [1,2,'A',4]
		expect { IndividualSeriesArithmeticMean.new(@data_series) }.to raise_error(RangeError)
	end		
end