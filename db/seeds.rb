# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(name: "Admin", email: "admin@example.com", password:"password")
recipe = Recipe.create(user_id: admin.id, ingredients: "1t water, 2T flour, 2C sugar", method:"mix together and bake in a pie dish", notes:"serves 15 hungry kids", image_url:"https://i.imgur.com/1c39kDD.jpeg")
