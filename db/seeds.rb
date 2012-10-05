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

@chains = Chain.all
@products = Product.all

ActiveRecord::Base.clear_cache!
ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/voronezh.sqlite3',
    pool: 5,
    timeout: 5000
)      

1.upto(5) do |i|
  Area.create(name: "Район города № #{i.to_s}")
end
      
@chains.each do |chain|
  1.upto(rand(20)) do |i|
    area_id = rand(Area.all.count)
    area_id += 1 if area_id == 0
    adds = 'адрес магазина ' + i.to_s
    Shop.create(chain_id: chain.id, area_id: area_id, adds: adds, name: chain.name, raiting: rand(3))
  end
end

Shop.all.each do |shop|
  @products.each do |prod|
    1.upto(2) do |i|
      name = 'продовольственный товар № ' + i.to_s
      ShopProduct.create(product_id: prod.id, shop_id: shop.id, price: rand(1000), name: name)
    end
  end
end