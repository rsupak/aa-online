# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
superman = Superhero.create(name: 'Superman', alias: 'Clark Kent')
batman = Superhero.create(name: 'Batman', alias: 'Bruce Wayne')

Ability.create(name: 'flight', hero_id: superman.id)
Ability.create(name: 'super strength', hero_id: superman.id)
Ability.create(name: 'genius-level intellect', hero_id: batman.id)
Ability.create(name: 'ninjitsu', hero_id: batman.id)
