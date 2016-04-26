# The program takes a set of data containing only numbers upon class initialization 
# and returns the adjusted R-squared
#
# Author::		Carl Andrew Menning 
# Copyright:: 	Copyright (c) 2016 

# This class accepts a three numbers upon initialization 
# 
# If not, it will request new user input until it only contains letters
# 
# The determine_adjustment method determines the adjusted R2 based on starting R2, 
# data size and number of regression coefficients including the intercept
class AdjustedRSquared
	attr_accessor :r_square, :data_size, :num_regression_coefficients
	attr_reader	:adjusted_r_square
	
	def initialize(r_square, data_size, num_regression_coefficients)
		@r_square = r_square
		@data_size = data_size
		@num_regression_coefficients = num_regression_coefficients
		if validate_parameters
			@adjusted_r_square = determine_adjustment(@r_square, @data_size, @num_regression_coefficients)
		else
			# Raise error
		end
	end
	
	def update_adjustment(r_square, data_size, num_regression_coefficients)
		@adjusted_r_square = determine_adjustment(r_square, data_size, num_regression_coefficients)
	end
	
	private
		def validate_parameters
			if @data_size > @num_regression_coefficients
				return true
			else
				return false
			end
		end
		
		def determine_adjustment(r_square, data_size, num_regression_coefficients)
			# R2adj = 1 - (1-(R2))(#datapoints - 1)/(#datapoints - #model_variables)
			# Need to use 1.0 to ensure floating point division
			return (1.0 - ((1.0 - r_square)*(data_size - 1.0))/(data_size-num_regression_coefficients))
		end
end
