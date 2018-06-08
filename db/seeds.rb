# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(name: "seed-generated product", description: "I created this product without using the HTML form!", color: "Gold", price: 123.45, image_url: "http://media.istockphoto.com/photos/kitten-on-a-white-background-picture-id511458158?k=6&m=511458158&s=170667a&w=0&h=YS27-I0nj5x89iDRUZ2YxE77hEghPb0HNCWwPCrMmn8=")

Product.create(name: "seed-generated product2", description: "I created this product without using the HTML form too!", color: "Shimmering White", price: 543.21, image_url: "http://media.istockphoto.com/photos/kitten-on-a-white-background-picture-id511458158?k=6&m=511458158&s=170667a&w=0&h=YS27-I0nj5x89iDRUZ2YxE77hEghPb0HNCWwPCrMmn8=")
