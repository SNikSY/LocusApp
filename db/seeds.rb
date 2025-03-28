require 'faker'

puts "Очистка и наполнение базы данных..."

[
  'users',
  'categories',
  'locations',
  'topics',
  'comments',
  'pictures'
].each do |seed_file|
  load Rails.root.join("db", "seeds", "#{seed_file}.rb")
end

puts "Сиды завершены!"
