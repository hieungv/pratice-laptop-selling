
User.create!(name: "Ha", email: "ha@gmail.com",
  password: "123123", password_confirmation: "123123", admin: true)
99.times do |n|
  name  = Faker::Name.name
  import_price = rand(500..2000)
  image_id = rand(1..8)
  product = Product.create!(name: name,
             import_price: import_price,
             export_price: import_price + 100,
             status: "1",
             image: rand(1..8),
             sale: "40")
  product.images.create image: "laptop/#{image_id}.jpg"
end
