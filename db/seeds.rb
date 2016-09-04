# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Player.create({name: 'Nitish', age: 22, description: '*cricket* player'})
#
# Brand.create({name: 'Nike', description: '*Need to wear while playing sports*', player_id: 251})


@player = Player.create(name: 'Nitish', age: 28, description: '*doing good*')
@brand = Brand.create(name: 'Nike', description: '*good brand*',attachment: 'spec/fixtures/brand.txt' ,player_id: @player.id)