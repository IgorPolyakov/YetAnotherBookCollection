# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.delete_all
list = %w(Science Satire Drama Romance Mystery Horror Health Guide Travel History Math Anthology Poetry Encyclopedias Dictionaries Comics Art Cookbooks Diaries Journals Series Trilogy Biographies Autobiographies Fantasy)
list.each { |item| Category.create!(name: item) }

# list.each { |item| puts item }
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?