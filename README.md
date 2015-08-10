# DateRangeOverlap

Library to check if two date ranges overlap each other and to retrieve the
overlap range if exists

## Installation

Add this line to your application's Gemfile:

    gem 'date_range_overlap'

then execute:

    $ bundle or bundle install

Or install it yourself as:

    $ gem install date_range_overlap

## Usage example

    > require 'date_range_overlap'

    > range1 = Date.today..Date.today + 5.days
    => Sun, 09 Aug 2015..Fri, 14 Aug 2015 

    > range2 = Date.today + 3.days..Date.today + 10.days
    => Wed, 12 Aug 2015..Wed, 19 Aug 2015

    > DateRangeOverlap.overlaps?(range1, range2) 
    => true

    > DateRangeOverlap.overlap_range(range1, range2) 
    => Wed, 12 Aug 2015..Fri, 14 Aug 2015
