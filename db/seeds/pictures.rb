puts "Создание картинок..."

Picture.destroy_all

users = User.where(admin: false)
topics = Topic.all

topics.each do |topic|
  Picture.create!(
    file_url: Faker::LoremFlickr.image(size: "300x200", search_terms: ['city', 'nature']),
    user: users.sample,
    imageable: topic
  )
end

puts "Создано картинок: #{Picture.count}"
