require 'date'
require 'active_support/time'

class DateRangeOverlap

	# Tells if the two ranges passed as parameters overlap
	# each other
	#
	# @param [Range] range1 the first range to compare
	# @param [Range] range2 the second range to compare
	# @return [Boolean] true if the two ranges overlap each
	# 			other. false, otherwise.
	#
	def self.overlaps?(range1, range2)
		@range1 = range1.first < range1.last ? 
					range1 : range1.last..range1.first
		@range2 = range2.first < range2.last ? 
					range2 : range2.last..range2.first

		return true if ((@range1.first - @range2.last) * 
						(@range2.first - @range1.last)) >= 0
		return false
	end

	# Finds the overlap range and return it
	#
	# @param [Range] range1 the first range to compare
	# @param [Range] range2 the second range to compare
	# @return [Range, nil] the overlap range if exists. 
	# 			nil, otherwise
	#
	def self.overlap_range(range1, range2)

		return nil unless self.overlaps?(range1, range2)

		return [@range1.first, @range2.first].max..[@range1.last,@range2.last].min

  end
end
