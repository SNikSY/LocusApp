puts "Создание тем..."

Topic.destroy_all

users = User.where(admin: false)
categories = Category.all
locations = Location.all

10.times do
  Topic.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 5),
    creator_user_id: users.sample.id,
    category: categories.sample,
    location: locations.sample
  )
end

puts "Создано тем: #{Topic.count}"
