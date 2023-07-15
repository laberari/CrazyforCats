i = 0
until User.count == 20 do
    User.create(email: "test#{i}@email.com", password: "123456" , "password_confirmation": "123456" , photo: Faker::Avatar.unique.image, name: Faker::Name.unique.name)
    i += 1
end 

users = User.all

users.each do |user| 
    Post.create(title: Faker::Book.title,
     description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), 
     when_went: Faker::Date.between(from: 10.years.ago, to: Date.today), 
     place: Faker::Address.country,
     user_id: user.id)
end 

posts = Post.all
until Comment.count == 100 do
    Comment.create(content: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false), 
    post_id: posts.sample.id, 
    user_id: users.sample.id)
end

 
until Reaction.count == 100 do 
    
        Reaction.create(post_id: posts.sample.id,
        user_id: users.sample.id,
        kind: kinds.sample,
        reaction_type: rel_type)
    
end