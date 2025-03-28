puts "Создание категорий..."

Category.destroy_all

3.times do
  Category.create!(title: Faker::Book.genre)
end

puts "Создано категорий: #{Category.count}"
