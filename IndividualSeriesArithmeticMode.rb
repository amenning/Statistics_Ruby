# The program takes a set of individual data containing only numbers upon class initialization 
# and returns the arithmetic mode(s)
#
# Author::		Carl Andrew Menning 
# Copyright:: 	Copyright (c) 2016 

# This class accepts an array of individual values and determines the arithmetic mode
# by first sorting the values in ascending order followed by counting the frequency of each value

class IndividualSeriesArithmeticMode
	# There are 2 variables
	# :mode for the final calculated arithmetic mode
	# :data_series for the full set of data to be analyzed in an array
	attr_reader :mode, :data_series
	
	# Initialize and determine the mode value(s) of the array of values after sorting
	def initialize(data_series)
		@data_series = data_series
		update_mode(@data_series)
	end
	
	# Update instance mode based on a new  data series array
	def update_mode(data_series=@data_series)
		if validate_parameters
			@mode = determine_mode(data_series)
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
	
		# Method called internally to calculate mode of input array
		def determine_mode(data_series)
			#Sort array values in ascending order
			sorted_data_series = data_series.sort
			#Determine frequency of each value
			mode = []
			values = {}
			largest_freq = 0
			data_series.each do |x|
				if values.key?(x)
					values[x]+=1
				else
					values[x]=1
				end
				(largest_freq = values[x]) if (largest_freq < values[x])
			end
			values.each do |key, value|
				mode.push(key) if value == largest_freq
			end
			#Return sorted modes in ascending order
			return mode.sort
		end
end