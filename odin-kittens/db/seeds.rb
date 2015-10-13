# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Kitten.delete_all

kittens = ["Mr. Buttons", "Snugglepuss", "Fluffy-Fluffykins", "Sir Wagg-a-lot", "Princes Purrsephone"]

kittens.each do |kitten|
	Kitten.create(name: kitten, age: rand(1..20), cuteness: rand(6), softness: rand(6))
end
