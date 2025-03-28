puts "Создание пользователей..."

User.destroy_all

admin_user = User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true,
  full_name: 'Admin User',
  bio: 'Я главный администратор.'
)

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

puts "Создано пользователей: #{User.count}"
