# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#デモジャンル種類(７種類)
  Genre.create!(
    name: "ショートケーキ",
  )
  Genre.create!(
    name: "チーズケーキ",
  )
  Genre.create!(
    name: "チョコレートケーキ",
  )
  Genre.create!(
    name: "モンブラン",
  )
  Genre.create!(
    name: "ミルフィーユ",
  )
  Genre.create!(
    name: "プリン",
  )
  Genre.create!(
    name: "クッキー",
  )

# デモ商品データ(10種類)
  Product.create!(
    name: "プリン",
    description: "生クリームを通常より多く配合することで、濃厚な味わいを体験できるプリンになっています",
    ex_price: "500",
    is_active: 1,
    genre_id: 6,
    image: File.open("./app/assets/images/demo_product_image/プリン.jpg")
  )
  Product.create!(
    name: "卵プリン(1個)",
    description: "卵の形をしたユニークな見た目なので、サプライズにぴったり",
    ex_price: "300",
    is_active: 1,
    genre_id: 6,
    image: File.open("./app/assets/images/demo_product_image/卵プリン.jpg")
  )
  Product.create!(
    name: "チーズ入りクッキー(6枚入り)",
    description: "チーズクッキーは生地となるラングドシャだけでなく、間にサンドしたホワイトチョコにもチーズが入っています。ダイレクトにチーズの美味しさを感じられるのでチーズ好きにはたまらないクッキーです",
    ex_price: "700",
    is_active: 1,
    genre_id: 7,
    image: File.open("./app/assets/images/demo_product_image/クッキー.jpg")
  )
  Product.create!(
    name: "チョコレートケーキ(ホール)",
    description: "職人が毎月ベルギーに出向いて直接発注を行いケーキに合うチョコレートを選んで作っております",
    ex_price: "2600",
    is_active: 1,
    genre_id: 3,
    image: File.open("./app/assets/images/demo_product_image/チョコレートケーキ.jpg")
  )
  Product.create!(
    name: "モンブラン",
    description: "甘さはやや控えめですが、外側は洋栗のペースト、内側には蒸した和栗が入っていてこれぞ！“モンブランの王様”",
    ex_price: "700",
    is_active: 1,
    genre_id: 4,
    image: File.open("./app/assets/images/demo_product_image/モンブラン.jpg")
  )
  Product.create!(
    name: "ミルフィーユ",
    description: "ミルフィーユ オーフレーズは、パイ生地は硬めで薄く焼き上げられ、食感が良いそう。濃厚なクリームはトロトロで、時間がたってもパイ生地がサクサクとのことで、お土産にもとても良いです",
    ex_price: "750",
    is_active: 1,
    genre_id: 5,
    image: File.open("./app/assets/images/demo_product_image/ミルフィーユ.jpg")
  )
  Product.create!(
    name: "チーズケーキ(ホール)",
    description: "デンマーク産のクリームチーズを使い、職人が1本1本ていねいに焼き上げております　そのため数量限定商品になります (ホール)",
    ex_price: "3200",
    is_active: 1,
    genre_id: 2,
    image: File.open("./app/assets/images/demo_product_image/チーズケーキ(ホール).jpg")
  )
  Product.create!(
    name: "チーズケーキ(1カット)",
    description: "デンマーク産のクリームチーズを使い、職人が1本1本ていねいに焼き上げております　そのため数量限定商品になります",
    ex_price: "750",
    is_active: 1,
    genre_id: 2,
    image: File.open("./app/assets/images/demo_product_image/チーズケーキ.jpg")
  )
Product.create!(
    name: "ショートケーキ(ホール)",
    description: "北海道の厳選された小麦と牛乳を使い、クリームの口当たりは滑らかに　スポンジはふわふわに仕上げました (ホール)",
    ex_price: "2600",
    is_active: 1,
    genre_id: 1,
    image: File.open("./app/assets/images/demo_product_image/ショートケーキ(ホール).jpg")
  )
  Product.create!(
    name: "ショートケーキ(1カット)",
    description: "北海道の厳選された小麦と牛乳を使い、クリームの口当たりは滑らかに　スポンジはふわふわに仕上げました",
    ex_price: "600",
    is_active: 1,
    genre_id: 1,
    image: File.open("./app/assets/images/demo_product_image/ショートケーキ(カット).jpg")
  )

# 会員デモデータ(11人)
    Member.create!(
      family_name: "伊達",
      family_kana: "ダテ",
      first_name: "みきお",
      first_kana: "ミキオ",
      email: "Sandwichman@test.com",
      postal_code: "1974905",
      address: "東京都品川区上大崎2-15-22",
      phone_number: "09012345678",
      is_deleted: false,
      password: "password",
    )
    Member.create!(
      family_name: "出川",
      family_kana: "デガワ",
      first_name: "哲郎",
      first_kana: "テツロウ",
      email: "Degawa@test.com",
      postal_code: "2210052",
      address: "神奈川県横浜市神奈川区栄町８９",
      phone_number: "09012345678",
      is_deleted: false,
      password: "password",
    )
    Member.create!(
      family_name: "竈門",
      family_kana: "カマド",
      first_name: "炭治郎",
      first_kana: "タンジロウ",
      email: "改横水車@test.com",
      postal_code: "2020714",
      address: "東京都新宿区",
      phone_number: "09012345678",
      is_deleted: false,
      password: "password",
    )
    Member.create!(
      family_name: "桐ヶ谷",
      family_kana: "キリガヤ",
      first_name: "和人",
      first_kana: "カズト",
      email: "DarkRepulser@test.com",
      postal_code: "2008107",
      address: "長崎県佐世保市ハウステンボス町１−１",
      phone_number: "09012345678",
      is_deleted: false,
      password: "password",
    )
    Member.create!(
      family_name: "結城",
      family_kana: "ユウキ",
      first_name: "明日奈",
      first_kana: "アスナ",
      email: "Lambentlight@test.com",
      postal_code: "2007930",
      address: "広島県広島市中区大手町１−１０",
      phone_number: "09012345678",
      is_deleted: false,
      password: "password",
    )
    Member.create!(
      family_name: "安楽岡",
      family_kana: "ヤスラオカ",
      first_name: "花火",
      first_kana: "ハナビ",
      email: "Yasuraoka@test.com",
      postal_code: "2021527",
      address: "東京都港区",
      phone_number: "09012345678",
      is_deleted: false,
      password: "password",
    )
    Member.create!(
      family_name: "大泉",
      family_kana: "オオイズミ",
      first_name: "洋",
      first_kana: "ヨウ",
      email: "Ooizumi@test.com",
      postal_code: "1973403",
      address: "北海道江別市大麻",
      phone_number: "09012345678",
      is_deleted: false,
      password: "password",
    )
    Member.create!(
      family_name: "伊藤",
      family_kana: "イトウ",
      first_name: "博文",
      first_kana: "ヒロブミ",
      email: "Itou@test.com",
      postal_code: "1841016",
      address: "山口県萩市椿東",
      phone_number: "09012345678",
      is_deleted: false,
      password: "password",
    )
    Member.create!(
      family_name: "竈門",
      family_kana: "カマド",
      first_name: "禰豆子",
      first_kana: "ネズコ",
      email: "nezuko@test.com",
      postal_code: "2021228",
      address: "東京都渋谷区神南",
      phone_number: "09012345678",
      is_deleted: false,
      password: "password",
    )
    Member.create!(
      family_name: "菅",
      family_kana: "スガ",
      first_name: "義偉",
      first_kana: "ヨシヒデ",
      email: "Suga-chan@test.com",
      postal_code: "2320017",
      address: "神奈川県横浜市南区宿町２丁目４９",
      phone_number: "09012345678",
      is_deleted: false,
      password: "password",
    )
    Member.create!(
      family_name: "日向",
      family_kana: "ヒナタ",
      first_name: "翔陽",
      first_kana: "ショウヨウ",
      email: "volleyball@test.com",
      postal_code: "2021621",
      address: "東京都渋谷区神南",
      phone_number: "09012345678",
      is_deleted: false,
      password: "password",
    )


#配送先デモデータ(3つ)

    Address.create!(
      name: "各務原 なでしこ",
      postal_code: "2021304",
      address: "長野県岡谷市今井",
      member_id: 1,
    )
    Address.create!(
      name: "安倍 晋三",
      postal_code: "1008111",
      address: "東京都千代田区千代田",
      member_id: 1,
    )
    Address.create!(
      name: "富澤たけし",
      postal_code: "1410021",
      address: "東京都品川区上大崎2-15-22 ",
      member_id: 1,
    )


#配送先デモデータ(2つ)(違う会員id)
    Address.create!(
      name: "高橋 英樹",
      postal_code: "1234567",
      address: "北海道札幌市",
      member_id: 2,
    )
    Address.create!(
      name: "サントリー白州",
      postal_code: "4080316",
      address: "山梨県北杜市白州町鳥原２９１３−１",
      member_id: 2,
    )
    #管理者側データ
    Admin.create!(
      email: "test@test.com",
      password: "password",
    )
