user = User.create!(email: 'test1@test.com', password: 'password1')

10.times do
  post = user.posts.create!(title: Faker::Lorem.sentence, description: Faker::Matz.quote)

  rand(5).times do
    post.comments.create!(body: Faker::Lorem.sentence)
  end
end
