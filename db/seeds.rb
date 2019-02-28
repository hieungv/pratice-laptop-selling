
User.create!(name: "Ha", email: "ha@gmail.com",
  password: "123123", password_confirmation: "123123", admin: true)
Image.create!(product_id: "1", image: "products/6.jpg")
Product.create!(name: "Laptop xxx",
             import_price: "200",
             export_price: "300",
             status: "1",
             image: "1")

99.times do |n|
  name  = Faker::Name.name
  Product.create!(name: name,
             import_price: "200",
             export_price: "300",
             status: "1",
             image: "1")
end
