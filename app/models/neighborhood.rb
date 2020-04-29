class Neighborhood < ActiveRecord::Base
  belongs_to :city
  has_many :listings

def neighborhood_openings(start_date, end_date)
    self.listings.select do |listing|
      listing.reservations.none? do |res|
        res.checkin <= Date.parse(end_date) && res.checkout >= Date.parse(start_date)
      end
    end
  end
  
	  def self.most_res
    most_reserved_nh = nil
    highest_res = 0
    Neighborhood.all.each do |nh|

      sum_of_reservations = 0

      nh.listings.each do |listing|
        sum_of_reservations += listing.reservations.count
      end

      if sum_of_reservations > highest_res
        highest_res = sum_of_reservations
        most_reserved_nh = nh
      end
    end
    most_reserved_nh
  end


  def self.highest_ratio_res_to_listings
    highest_ratio_nh = nil
    highest_ratio = 0
    Neighborhood.all.each do |nh|

      sum_of_listings = nh.listings.count
      sum_of_reservations = 0

      nh.listings.each do |listing|
        sum_of_reservations += listing.reservations.count
      end

      ratio_reservations_listings = sum_of_reservations / sum_of_listings

      if ratio_reservations_listings > highest_ratio
        highest_ratio = ratio_reservations_listings
        highest_ratio_nh = nh
      end
    end
    highest_ratio_nh
  end
end

