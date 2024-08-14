# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# ----Destroys everything----
puts "destroying reviews..."
Review.destroy_all
puts "destroying requests..."
Request.destroy_all
puts "destroying costumes..."
Costume.destroy_all
puts "destroying users..."
User.destroy_all

# ----Creates our users so we can log in----
User.create(email: 'mia@gmail.com', username: 'mia', password: 'miamia')
User.create(email: 'yu@gmail.com', username: 'yu', password: 'yuyu')
User.create(email: 'akitaka@gmail.com', username: 'akitaka', password: 'akitakaakitaka')
User.create(email: 'max@gmail.com', username: 'max', password: 'maxmax')

10.times do
  user = User.new({
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: Faker::Internet.password(min_length: 8)
  })
  user.save! # Save the user to the database

  3.times do
    costume = Costume.new({
      title: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence(word_count: 10),
      size: Costume::SIZE.sample,
      price: Faker::Commerce.price(range: 1000..10000.0),
      category: Costume::CATEGORIES.sample,
      image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['clothing', 'fashion', 'costume']),
      user: user
    })
    costume.save! # Save the costume to the database

    3.times do
      start_date = Faker::Date.backward(days: 25)
      end_date = Faker::Date.between(from: start_date, to: start_date + 20.days)

      request = Request.new({
        costume: costume,
        user: user,
        status: 2,
        start_date: start_date,
        end_date: end_date,
      })
      request.save! # Save the request to the database

      3.times do
        Review.create({
          content: Faker::Lorem.sentence(word_count: 20),
          rating: rand(1..5), # Generate a random rating between 1 and 5
          user: user,
          request: request,
        })
      end
    end
  end
end






Costume.create(title: 'Hatsune Miku', description: 'The Hatsune Miku costume features a teal, sleeveless dress with a pleated skirt, paired with matching thigh-high boots and detached arm sleeves, all adorned with digital-themed patterns and accents. The look is completed with her signature long, twin-tailed wig in vibrant aqua blue, along with a black and teal tie, and futuristic-looking headphones.', size: 'M', price: 1000, category: 'Anime', user_id: 2)
Costume.create(title: 'Banana', description: 'The banana costume is a bright yellow, full-body suit shaped like a ripe banana, complete with a pointed top and curved design for a playful, oversized appearance. It has openings for the face, arms, and legs, with a soft fabric material that ensures comfort and easy movement.', size: 'S', price: 2000, category: 'Scary', user_id: 1)
Costume.create(title: 'Dog', description: 'The dog costume is a cozy, full-body suit made of soft, plush fabric, designed to resemble a playful canine with floppy ears, a wagging tail, and a snout. It includes a hood with a detailed dog face, and the suit typically comes in various colors and patterns to mimic different dog breeds.', size: 'L', price: 3000, category: 'Animal', user_id: 1)
