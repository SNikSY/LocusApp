puts "Создание комментариев..."

Comment.destroy_all

users = User.where(admin: false)
topics = Topic.all

20.times do
  Comment.create!(
    content: Faker::Lorem.sentence(word_count: 10),
    user: users.sample,
    topic: topics.sample
  )
end

puts "Создано комментариев: #{Comment.count}"
