# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.delete_all
User.delete_all
Book.delete_all
list = %w[ Android Assembler C/C++ C# Database Java JavaScript Rust Other PHP Python Ruby Go Swift ]
list.each { |item| Category.create!(name: item) }

User.create(name: 'admin', email: 'ad@m.in', password: 'so_secyre', has_priveleges: true)
current_user = User.first.id
def upload(name)
  File.open(Rails.root + "db/#{name}.jpg")
end
Book.create(book_cover: upload('java'), category_id: Category.find_by(name: 'Java').id, user_id: current_user, title: 'Java 9 Cookbook', author: 'Mohamed Sanaulla, Nick Samoylov', desc: 'This cookbook offers a range of software development examples in simple and straightforward Java 9 code, providing step-by-step resources and time-saving methods to help you solve data problems efficiently.')
Book.create(book_cover: upload('android'), category_id: Category.find_by(name: 'Android').id, user_id: current_user, title: 'Head First Android Development: A Brain-Friendly Guide, 2nd Edition', author: 'Dawn Griffiths, David Griffiths', desc: 'If you have an idea for a killer Android app, this fully revised and updated edition will help you build your first working application in a jiffy.')
Book.create(book_cover: upload('rust'), category_id: Category.find_by(name: 'Rust').id, user_id: current_user, title: 'Programming Rust: Fast, Safe Systems Development', author: 'Jason Orendorff, Jim Blandy', desc: 'This practical book introduces systems programmers to Rust, the new and cutting-edge language that’s still in the experimental/lab stage.')
Book.create(book_cover: upload('c++'), category_id: Category.find_by(name: 'C/C++').id, user_id: current_user, title: 'C++17 STL Cookbook', author: 'Jacek Galowicz', desc: 'Over 90 recipes that leverage the powerful features of the Standard Library in C++17.')
Book.create(book_cover: upload('ruby'), category_id: Category.find_by(name: 'Ruby').id, user_id: current_user, title: 'Agile Web Development with Rails 5', author: 'Sam Ruby', desc: 'Ruby on Rails helps you produce high-quality, beautiful-looking web applications quickly. You concentrate on creating the application, and Rails takes care of the details.')
Book.create(book_cover: upload('python'), category_id: Category.find_by(name: 'Python').id, user_id: current_user, title: 'Thoughtful Machine Learning with Python: A Test-Driven Approach', author: 'Matthew Kirk', desc: ' With Early Release ebooks, you get books in their earliest form—the author’s raw and unedited content as he or she writes—so you can take advantage of these technologies long before the official release of these titles.')
Book.create(book_cover: upload('javascript'), category_id: Category.find_by(name: 'JavaScript').id, user_id: current_user, title: 'JavaScript-mancy: Object-Oriented Programming', author: 'Jaime González García, Artur Mizera', desc: 'Mastering the Arcane Art of Summoning Objects in JavaScript Imagine imagine you lived in a world were you could use JavaScript to change the universe around you, to tamper with the threads that compose reality as you know it and do anything that you can imagine.')
Book.create(book_cover: upload('php'), category_id: Category.find_by(name: 'PHP').id, user_id: current_user, title: 'Laravel: Up and Running: A Framework for Building Modern PHP Apps', author: 'Matt Stauffer', desc: 'What sets Laravel apart from other PHP web frameworks? Speed and simplicity, for starters. This rapid application development framework and its vast ecosystem of tools let you quickly build new sites and applications with clean, readable code.')
