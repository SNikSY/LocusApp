require 'faker'

# Очистка базы данных перед добавлением новых данных
User.destroy_all
Category.destroy_all
Location.destroy_all
Topic.destroy_all
Comment.destroy_all
Picture.destroy_all

# Создаём админа
admin_user = User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true,
  full_name: 'Admin User',
  bio: 'Я главный администратор.'
)

# Создаём обычных пользователей
5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password',
    admin: false,
    full_name: Faker::Name.name,
    bio: Faker::Lorem.sentence(word_count: 10)
  )
end

users = User.where(admin: false)

# Создаём категории
categories = []
3.times do
  categories << Category.create!(title: Faker::Book.genre)
end

# Создаём локации
locations = []
3.times do
  locations << Location.create!(
    name: Faker::Address.city,
    region: Faker::Address.state,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
end

# Создаём темы (topics)
10.times do
  Topic.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 5),
    creator_user_id: users.sample.id,
    category: categories.sample,
    location: locations.sample
  )
end

topics = Topic.all

# Создаём комментарии к темам
20.times do
  Comment.create!(
    content: Faker::Lorem.sentence(word_count: 10),
    user: users.sample,
    topic: topics.sample
  )
end

# # Создаём картинки для тем (полиморфные связи)
# topics.each do |topic|
#   Picture.create!(
#     file_url: Faker::LoremFlickr.image(size: "300x200", search_terms: ['city', 'nature']),
#     user: users.sample,
#     imageable: topic
#   )
# end

puts "Создано:"
puts "Пользователи: #{User.count}"
puts "Категории: #{Category.count}"
puts "Локации: #{Location.count}"
puts "Темы: #{Topic.count}"
puts "Комментарии: #{Comment.count}"
# puts "Картинки: #{Picture.count}"
