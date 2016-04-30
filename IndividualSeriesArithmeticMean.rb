# The program takes a set of individual data containing only numbers upon class initialization 
# and returns the arithmetic mean
#
# Author::		Carl Andrew Menning 
# Copyright:: 	Copyright (c) 2016 

# This class accepts an array of individual values and determines the arithmetic mean as follows
#
# Xavg = Sum(Xi)/N 
# where Xavg is the average value, Xi is the ith individual value, and N is the total number of values
# 
class IndividualSeriesArithmeticMean
	# There are 3 variables
	# :average for the final calculated arithmetic mean
	# :data_series for the full set of data to be analyzed in an array
	# :data_length for the number of data points
	attr_reader :average, :data_series, :data_length
	
	# Initialize and determine adjusted R2 based on R2, data size, and number of coefficients
	def initialize(data_series)
		@data_series = data_series
		update_average(@data_series)
	end
	
	# Update instance average based on a new  data series array
	def update_average(data_series=@data_series)
		if validate_parameters
			@average = determine_average(data_series)
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
	
		# Method called internally to calculate adjusted R2 based on input
		def determine_average(data_series)
			# Xavg = Sum(Xi)/N 
			# Need to use 1.0 to ensure floating point division
			total = 0
			data_series.each do |x|
				total += x
			end
			# Use to_f to ensure floating point division
			average = total.to_f/data_series.length
			return average
		end
end