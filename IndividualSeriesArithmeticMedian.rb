# The program takes a set of individual data containing only numbers upon class initialization 
# and returns the arithmetic median
#
# Author::		Carl Andrew Menning 
# Copyright:: 	Copyright (c) 2016 

# This class accepts an array of individual values and determines the arithmetic median
# by first sorting the values in ascending order followed by returning either:
# (a) the middle element of an odd array
# (b) the average of two elements in the middle of an even array
class IndividualSeriesArithmeticMedian
	# There are 3 variables
	# :median for the final calculated arithmetic median
	# :data_series for the full set of data to be analyzed in an array
	attr_reader :median, :data_series
	
	# Initialize and determine the median value of the array of values after sorting
	def initialize(data_series)
		@data_series = data_series
		update_median(@data_series)
	end
	
	# Update instance median based on a new  data series array
	def update_median(data_series=@data_series)
		if validate_parameters
			@median = determine_median(data_series)
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
	
		# Method called internally to calculate median of input array
		def determine_median(data_series)
			#Sort array values in ascending order
			sorted_data_series = data_series.sort
			#Determine if array of data is odd or even
			if (data_series.length%2==0) #If data array is of even length
				#Determine index number of element just before and after of middle of array
				middle_index_lower = data_series.length/2-1	#Index of value just left of array middle
				middle_index_upper = data_series.length/2	#Index of value just right of array middle
				
				#Obtain values for sorted elements with index just before and after array middle point
				middle_value_lower = sorted_data_series[middle_index_lower]
				middle_value_upper = sorted_data_series[middle_index_upper]
				
				return median = ((middle_value_lower+middle_value_upper)/2).to_f
			else # If data array is of odd length
				middle_index = data_series.length/2 #Note this will return integer round down
				return median = sorted_data_series[middle_index]
			end
		end
end