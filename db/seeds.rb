# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
puts '== Creating sample users  =='
10.times do
		user = (0..4).map { ('a'..'z').to_a[rand(26)] }.join
		User.create! name: user, email: "#{user}@gmail.com", phone: rand(1_000_000_000..9_999_999_999)
	end
puts '== Created some sample users  =='
