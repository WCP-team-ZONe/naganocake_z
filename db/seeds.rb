# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# デモ商品データ(9つ)
9.times do |n|
    Products.create!(
      name: "demo商品#{n + 1}",
      description: "説明文説明文説明文#{n + 1}",
      ex_price: "99#{n + 1}",
      is_active: "0",
      image_id: File.open('./app/assets/images/demo_product_image/naganocake#{n + 1}.jpg')
    )
end