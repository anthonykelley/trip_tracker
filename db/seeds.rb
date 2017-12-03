

#locations
30.times do |n|
  name = Faker::TwinPeaks.location
  country = Faker::Address.country
  address = Faker::Address.street_address
  Location.create!(name: name, country: country, address: address)

end
