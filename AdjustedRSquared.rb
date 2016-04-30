# The program takes a set of data containing only numbers upon class initialization 
# and returns the adjusted R-squared
#
# Author::		Carl Andrew Menning 
# Copyright:: 	Copyright (c) 2016 

# This class accepts three numbers upon initialization 
# It determines the adjusted R2 based on the data size and number of regression coefficients
# The determine_adjustment method determines the adjusted R2 based on starting R2, 
# data size and number of regression coefficients including the intercept
class AdjustedRSquared
	attr_reader :adjusted_r_square, :r_square, :data_size, :num_regression_coefficients
	
	# Initialize and determine adjusted R2 based on R2, data size, and number of coefficients
	def initialize(r_square, data_size, num_regression_coefficients)
		@r_square = r_square
		@data_size = data_size
		@num_regression_coefficients = num_regression_coefficients
		update_adjustment(@r_square, @data_size, @num_regression_coefficients)
	end
	
	# Update instance R2 based on new R2, data size or number of regression coefficients, all inputs have default values to current instance values
	def update_adjustment(r_square=@r_square, data_size=@data_size, num_regression_coefficients=@num_regression_coefficients)
		if validate_parameters
			@adjusted_r_square = determine_adjustment(r_square, data_size, num_regression_coefficients)
		else
			raise RangeError, "The parameters must all be numbers with data size (n) > 1, data size (n) greater than number of regression coefficients (k), and 0<=R^2<=1"
		end
	end
	
	private
		# Validate parameters are numbers and in range
		def validate_parameters
			return false unless validate_parameters_type
			return false unless validate_r_square_within_0_to_1
			return false unless validate_data_size_greater_than_one
			return false unless validate_num_regression_coefficients_greater_than_0
			return false unless validate_data_size_greater_than_num_regression_coefficients
			return true
		end
		
		# Validate parameters are Fixnum or Bignum for data size and number of coefficients; and Float or Fixnum for input R2 
		def validate_parameters_type
			return false unless (@data_size.instance_of?(Fixnum) || @data_size.instance_of?(Bignum))
			return false unless (@num_regression_coefficients.instance_of?(Fixnum) || @num_regression_coefficients.instance_of?(Bignum))
			return false unless (@r_square.instance_of?(Float) || @r_square.instance_of?(Fixnum))
			return true
		end
		
		# Validate input R2 is larger than 0 and less than or equal to 1
		def validate_r_square_within_0_to_1
			if (@r_square >= 0 && @r_square <= 1.0)
				return true
			else
				return false
			end
		end

		# Validate data size is greater than 1 so there isn't a divide by 0 error
		def validate_data_size_greater_than_one
			if @data_size > 1
				return true
			else
				return false
			end
		end				
	
		# Validate number of regression coefficients is greater than 0
		def validate_num_regression_coefficients_greater_than_0
			if @num_regression_coefficients > 0
				return true
			else
				return false
			end
		end
		
		# Validate data size is greater than the number of regression coefficients so there isn't a divide by zero error
		def validate_data_size_greater_than_num_regression_coefficients
			if @data_size > @num_regression_coefficients
				return true
			else
				return false
			end
		end
	
		# Method called internally to calculate adjusted R2 based on input
		def determine_adjustment(r_square, data_size, num_regression_coefficients)
			# R2adj = 1 - (1-(R2))(#datapoints - 1)/(#datapoints - #model_variables)
			# Need to use 1.0 to ensure floating point division
			return (1.0 - ((1.0 - r_square)*(data_size - 1.0))/(data_size-num_regression_coefficients))
		end
end