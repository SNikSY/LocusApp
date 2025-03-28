puts "Создание локаций..."

Location.destroy_all

3.times do
  Location.create!(
    name: Faker::Address.city,
    region: Faker::Address.state,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
end

puts "Создано локаций: #{Location.count}"
