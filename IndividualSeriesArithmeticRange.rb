# The program takes a set of individual data containing only numbers upon class initialization 
# and returns the arithmetic range
#
# Author::		Carl Andrew Menning 
# Copyright:: 	Copyright (c) 2016 

# This class accepts an array of individual values and determines the arithmetic range
# by first sorting the values in ascending order followed by taking the difference between the max and min values

class IndividualSeriesArithmeticRange
	# There are 3 variables
	# :range for the final calculated arithmetic range = max - min values
	# :coefficient_of_range is determined as (max-min)/(max+min) 
	# :data_series for the full set of data to be analyzed in an array
	attr_reader :range, :coefficient_of_range,:data_series
	
	# Initialize and determine the range value(s) of the array of values after sorting
	def initialize(data_series)
		@data_series = data_series
		update_range(@data_series)
	end
	
	# Update instance range based on a new  data series array
	def update_range(data_series=@data_series)
		if validate_parameters
			result = determine_range(data_series)
			@range = result[:range]
			@coefficient_of_range = result[:coefficient_of_range]
		else
			raise RangeError, "The input parameter must be an array with all numbers"
		end
	end
	
	private
		# Validate parameter is an array of numbers
		def validate_parameters
			return false unless validate_data_series_is_array
			return false unless validate_data_series_array_is_not_empty
			return false unless validate_all_data_series_elements_are_numbers
			return true
		end
		
		# Validate input parameter is an array
		def validate_data_series_is_array
			return false unless (@data_series.kind_of?(Array))
			return true
		end
		
		# Validate all array elments are numbers
		def validate_all_data_series_elements_are_numbers
			for element in @data_series
				return false unless (element.kind_of?(Fixnum) || element.kind_of?(Bignum) || element.kind_of?(Float))
			end
			return true
		end

		# Validate data size is greater than 0 so there isn't a divide by 0 error
		def validate_data_series_array_is_not_empty
			return false unless (@data_series.length > 0)
			return true
		end				
	
		# Method called internally to calculate range of input array
		def determine_range(data_series)
			#Sort array values in ascending order
			sorted_data_series = data_series.sort
			#Determine range as the difference between the largest and minimum value
			max = sorted_data_series[sorted_data_series.length-1]
			min = sorted_data_series[0]
			range = max - min
			coefficient_of_range = (range/(max + min)).to_f
			#Return sorted ranges in ascending order
			return {range: range, coefficient_of_range: coefficient_of_range}
		end
end