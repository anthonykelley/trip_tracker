class Location < ApplicationRecord
  belongs_to :trip, optional: true

  geocoded_by :address
  after_validation :geocode
end
