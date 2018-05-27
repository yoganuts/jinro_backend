# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale = :ja

Role.destroy_all
role_villager = Role.create(name: '村人', code: :villager)
role_beast = Role.create(name: '人狼', code: :beast)

# sample data
Village.destroy_all

10.times do |i|
  village = Village.new(name: Faker::Zelda.location, code: SecureRandom.base64(16))
  lottery_box = 4.times.reduce([true]) { |lot, _i| lot << false }
  5.times do |j|
    role = lottery_box[j] ? role_beast : role_villager
    village.villagers.build(village: village, name: "#{Faker::Name.last_name} #{Faker::Name.first_name}", code: SecureRandom.base64(16), role: role)
  end
  village.villagers.each do |villager|
    Random.rand(1..10).times do |j|
      villager.talks.build(content: Faker::Lorem.sentence)
    end
  end
  village.save
end
