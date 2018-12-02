# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "admin@admin.com", confirmed_at: Time.now, password: 'password', is_active: true)


User.create(email: "sai@yahoo.com", confirmed_at: Time.now, password: 'password', is_active: true, first_name: 'sai')
User.create(email: "avi@gmail.com", confirmed_at: Time.now, password: 'password', is_active: true, first_name: 'avinash')
User.create(email: "ram@gmail.com", confirmed_at: Time.now, password: 'password', is_active: true, first_name: 'ram')



