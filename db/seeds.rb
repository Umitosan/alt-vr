# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Realm.destroy_all
Review.destroy_all



testUser1 = User.create!(username: 'tuser1',
                       email: 'tuser1@gmail.com',
                       password: '1234567',
                       admin: false
)
testUser2 = User.create!(username: 'tuser2',
                       email: 'tuser2@gmail.com',
                       password: '1234567',
                       admin: false
)
User.create!(username: 'tadmin',
             email: 'tadmin@gmail.com',
             password: '1234567',
             admin: true
)


5.times do |j|
  someRealm = Realm.create!(name: Faker::HitchhikersGuideToTheGalaxy.planet,
                            description: Faker::HitchhikersGuideToTheGalaxy.quote,
                            price: 199.99,
                            image_url: Faker::LoremPixel.image

  )
  3.times do |j|
    someReview = Review.create!(body: Faker::RickAndMorty.quote,
                                realm_id: someRealm.id,
                                user_id: testUser1.id

    )
  end
  3.times do |j|
    someReview = Review.create!(body: Faker::RickAndMorty.quote,
                                realm_id: someRealm.id,
                                user_id: testUser2.id

    )
  end
end


p "Created #{User.count} users"
p "Created #{Realm.count} realms"
p "Created #{Review.count} reviews"
