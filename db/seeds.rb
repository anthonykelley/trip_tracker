

#locations
17.times do |n|
  name = Faker::TwinPeaks.location
  country = Faker::Address.country
  address = Faker::Address.street_address
  description = Faker::Lorem.paragraph
  Location.create!(name: name, country: country, address: address, description: description)

end
