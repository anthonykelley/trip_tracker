class Location < ApplicationRecord
  belongs_to :trip, optional: true
end
