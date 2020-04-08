User.create!(username: "FirstUser",
             email: "first.user@gmail.com",
             password: "654321",
             role: 'admin'
)

50.times do
  User.create!(username: Faker::Internet.username,
               email: Faker::Internet.safe_email,
               password: Faker::Internet.password
  )
end
