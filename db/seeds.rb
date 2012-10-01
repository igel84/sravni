# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User.destroy_all
#City.destroy_all

#cities = City.create([{ name: 'Воронеж' }, { name: 'Москва' }])
#user = User.new(
#  email:'admin@mlip.ru', 
#  password:'111111',
#  password_confirmation:'111111',
#  admin:true,
#  city_id:City.find_by_name('Воронеж').id)
#user.save

#user.activate!

Chain.all.each do |chain|
  1.upto(100) do |i|
    area_id = rand(Area.all.count)
    area_id += 1 if area_id == 0
    Shop.create(chain_id: chain.id, area_id: area_id, adds: i.to_s)
  end
end