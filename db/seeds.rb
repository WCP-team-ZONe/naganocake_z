# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# デモ商品データ(9つ)
2.times do |n|
  Genre.create!(
    name: "ケーキ#{n + 1}",
    )
end

9.times do |n|
  Product.create!(
    genre_id: 1,
    name: "demo商品#{n + 1}",
    description: "説明文説明文説明文#{n + 1}",
    ex_price: "100#{n + 1}",
    is_active: 1,
    image: File.open("./app/assets/images/demo_product_image/naganocake#{n + 1}.jpg")
  )
end

# 会員デモデータ(11人)
11.times do |n|
    Member.create!(
      family_name: "令和",
      family_kana: "レイワ",
      first_name: "#{n + 1}太郎",
      first_kana: "#{n + 1}タロウ",
      email: "test#{n + 1}@test.com",
      postal_code: "1540001",
      address: "東京都渋谷区神南",
      phone_number: "09012345678",
      is_deleted: false,
      password: "password",
    )
end

#配送先デモデータ(3つ)
3.times do |n|
  Address.create!(
    name: "宛先その#{n + 1}",
    postal_code: "1008111",
    address: "東京都千代田区千代田",
    member_id: 1,
  )
end

2.times do |n|
  Address.create!(
    name: "宛先その#{n + 1}",
    postal_code: "1234567",
    address: "北海道のどこか",
    member_id: 2,
  )
end