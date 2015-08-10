require 'date_range_overlap'

RSpec.describe DateRangeOverlap do

	today = Date.today
	five_days_from_today = today + 5.days

	describe "#overlaps?" do

		it "is expected to return false when two ranges don't overlap" do
			range1 = today..five_days_from_today
			range2 = today + 6.days..today + 10.days

			expect(DateRangeOverlap.overlaps?(range1, range2)).to be false
		end

		it "is expected to return true when two ranges overlap in one date" do
			range1 = today..five_days_from_today
			range2 = five_days_from_today..today + 10.days

			expect(DateRangeOverlap.overlaps?(range1, range2)).to be true
		end

		it "is expected to return false when the two ranges are the same" do
			range1 = today..five_days_from_today
			range2 = today..five_days_from_today

			expect(DateRangeOverlap.overlaps?(range1, range2)).to be true
		end

		it "is expected to return true when two ranges overlap" do
			range1 = today..five_days_from_today
			range2 = today + 3.days..today + 10.days

			expect(DateRangeOverlap.overlaps?(range1, range2)).to be true
		end

		it "is expected to return true when one range contains the another one" do
			range1 = today..today + 10.days
			range2 = today + 3.days..today + 8.days

			expect(DateRangeOverlap.overlaps?(range1, range2)).to be true
		end
	end

	describe "overlap_range" do

		it "is expected to return nil when two ranges don't overlap" do
			range1 = today..five_days_from_today
			range2 = today + 6.days..today + 10.days

			expect(DateRangeOverlap.overlap_range(range1, range2)).to be nil
		end

		it "is expected to return one date range 
        when two ranges overlap in one date" do
			range1 = today..five_days_from_today
			range2 = five_days_from_today..today + 10.days

			expect(DateRangeOverlap.overlap_range(range1, range2)).to eq(
        five_days_from_today..five_days_from_today)
		end

		it "is expected to return (today..five_days_from_today) range 
        when the two ranges are the same" do
			range1 = today..five_days_from_today
			range2 = today..five_days_from_today

			expect(DateRangeOverlap.overlap_range(range1, range2)).to eq(
        today..five_days_from_today)
		end

		it "is expected to return (today + 3.days..five_days_from_today) range 
        when two ranges overlap" do
			range1 = today..five_days_from_today
			range2 = today + 3.days..today + 10.days

			expect(DateRangeOverlap.overlap_range(range1, range2)).to eq(
        today + 3.days..five_days_from_today)
		end

		it "is expected to return (today + 3.days..today + 8.days) range 
        when one range contains the another one" do
			range1 = today..today + 10.days
			range2 = today + 3.days..today + 8.days

			expect(DateRangeOverlap.overlap_range(range1, range2)).to eq(
        today + 3.days..today + 8.days)
		end
	end
end
