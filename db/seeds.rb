# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"


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
mia = User.create!(email: 'mia@gmail.com', username: 'mia', password: 'miamia')
yu = User.create!(email: 'yu@gmail.com', username: 'yu', password: 'yuyuyu')
akitaka = User.create!(email: 'akitaka@gmail.com', username: 'akitaka', password: 'akitakaakitaka')
max = User.create!(email: 'max@gmail.com', username: 'max', password: 'maxmax')

key_users = [mia, yu, akitaka, max]

10.times do
  user = User.new({
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: Faker::Internet.password(min_length: 8)
  })
  user.save! # Save the user to the database

  # 3.times do
  #   costume = Costume.new({
  #     title: Faker::Commerce.product_name,
  #     description: Faker::Lorem.sentence(word_count: 10),
  #     size: Costume::SIZE.sample,
  #     price: Faker::Commerce.price(range: 1000..10000.0),
  #     category: Costume::CATEGORIES.sample,
  #     image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['clothing', 'fashion', 'costume']),
  #     user: user
  #   })
  #   costume.save! # Save the costume to the database


  # end
end

costumes = [
  {
    title: "Vampire Count Costume",
    description: "An elegant and gothic vampire costume, perfect for a night of bloodsucking adventure. Includes a long black cape, a white shirt with a ruffled collar, and a pair of fangs.",
    size: Costume::SIZE.sample,
    price: 4500,
    category: Costume::CATEGORIES.sample,
    image_url: ["https://i5.walmartimages.com/seo/Spooktacular-Creations-Gothic-Vampire-Costume-Deluxe-Set-for-Boys-Kids-Halloween-Party-Dress-Up-Role-Play-Cloak-and-Accessories_839e6f3b-98c2-4fee-b6bf-f068e861b3a3.2eac5f7bb27488851bbe0e81272cd3df.jpeg?odnHeight=320&odnWidth=320&odnBg=FFFFFF", "https://www.marthastewart.com/thmb/QxGClxuKZBzs9x5lEa4sD36ZizA=/2000x1428/filters:no_upscale()/vampire-costume-mSD104880vmpr_138-artesia-0621-2000-cf4dd34eab194e92935a84b11f497281.jpg", "https://i.pinimg.com/736x/27/c8/d3/27c8d3ddf49f3ffcb635ce3e08712be4.jpg", "https://media.istockphoto.com/id/1343495773/photo/boy-in-halloween-vampire-makeup-costume.jpg?s=612x612&w=0&k=20&c=zN7_3v1_mle3NdnfggIyVeqBCG8f1JH906u1PMa48dE="],
    user: User.all.sample
  },
  {
    title: "Pirate Captain Costume",
    description: "Set sail for adventure with this authentic pirate captain outfit. The costume includes a tricorne hat, a red coat, a white ruffled shirt, and a pair of black boots.",
    size: Costume::SIZE.sample,
    price: 5000,
    category: Costume::CATEGORIES.sample,
    image_url: ["https://images.halloweencostumes.ca/products/33320/2-1-301580/plus-size-womens-pirate-flag-gypsy-costume-alt-10.jpg", "https://history-making.com/wpsite/wp-content/uploads/2018/10/1730-pirate-captain-with-cutlass.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_QHfHKv5GD8hoJosWJEL6H7bkP8SN4GzqKQ&s", "https://m.media-amazon.com/images/I/81UgB399AhL._AC_UY1000_.jpg"],
    user: User.all.sample
  },
  {
    title: "Witch's Enchantment Costume",
    description: "Cast spells and brew potions in this enchanting witch costume. Features a pointed hat, a black dress with purple accents, and a broomstick for flying.",
    size: Costume::SIZE.sample,
    price: 4000,
    category: Costume::CATEGORIES.sample,
    image_url: ["https://parade.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cq_auto:good%2Cw_1200/MTkwNTgwODcyOTMxMzg3MjYw/diy-witch-costumes-00-png.png", "https://hips.hearstapps.com/hmg-prod/images/diy-witch-costumes-1-1629149157.jpeg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBw_m0QcO45XpK_3GLNHrs6Tf340zh14C-6Q&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWz4HAwsEHYGiIIoHWLXiFCG6tPrpQTgnIUg&s"],
    user: User.all.sample
  },
  {
    title: "Superhero Defender Costume",
    description: "Become the hero your city needs with this iconic superhero costume. Includes a muscle-bound suit, a flowing cape, and a mask to conceal your identity.",
    size: Costume::SIZE.sample,
    price: 6000,
    category: Costume::CATEGORIES.sample,
    image_url: ["https://www.speerise.com/cdn/shop/articles/blog_9.1.jpg?v=1630489805", "https://images.halloweencostumes.com/media/13/superman/superman-costume-for-adults.jpg", "https://4.bp.blogspot.com/-hRJJ4qMwiBg/VFDpPD_txfI/AAAAAAAAjXs/XlpW_fLU6JE/s1600/Superman%2Band%2BWonder%2BWoman-1.jpg", "https://henchman4hire.com/wp-content/uploads/2016/10/dc-superhero-girls-costumes-01.jpg"],
    user: User.all.sample
  },
  {
    title: "Medieval Knight Armor",
    description: "Defend your kingdom in this realistic knight armor costume. The set includes a metallic helmet, a chainmail shirt, and a sword to vanquish your enemies.",
    size: Costume::SIZE.sample,
    price: 7000,
    category: Costume::CATEGORIES.sample,
    image_url: ["https://i.etsystatic.com/35882827/r/il/cd5f18/5362074699/il_fullxfull.5362074699_9fh5.jpg", "https://m.media-amazon.com/images/I/71I-w2zc39L._AC_UF1000,1000_QL80_.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgZQ2Yn10yyc985QWG0qCNy-dcYdfJTSG1RA&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfUVPF6nzytu7y9NmrZumwGd9ub8yoj4JgnQ&s"],
    user: User.all.sample
  },
  {
    title: "Classic Clown Costume",
    description: "Bring joy and laughter to any party with this colorful clown costume. Includes a bright wig, a rainbow jumpsuit, oversized shoes, and a red nose.",
    size: Costume::SIZE.sample,
    price: 3000,
    category: Costume::CATEGORIES.sample,
    image_url: ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOzROkZ_rUJNY6yNANW52_QwlVilaTkvlXEg&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYvVIEnGBYhltxD4ZRBi3WU4zTLmidBgPaVg&s"],
    user: User.all.sample
  },
  {
    title: "Ghostly Apparition Costume",
    description: "Haunt your friends with this eerie ghost costume. The costume features a flowing white sheet with eyeholes cut out, perfect for a spooky night of scares.",
    size: Costume::SIZE.sample,
    price: 3500,
    category: Costume::CATEGORIES.sample,
    image_url: ["https://m.media-amazon.com/images/I/61gXkoBfi7L._AC_UY1000_.jpg", "https://cdn.outsideonline.com/wp-content/uploads/2023/10/halloween_costumes_S.jpg"],
    user: User.all.sample
  },
  {
    title: "Greek Goddess Costume",
    description: "Channel your inner deity with this stunning Greek goddess costume. The outfit includes a flowing white dress with golden accents and a laurel wreath crown.",
    size: Costume::SIZE.sample,
    price: 5500,
    category: Costume::CATEGORIES.sample,
    image_url: ["https://www.fashionnova.com/cdn/shop/products/GreekGoddess4PieceCostumeSet-Creamcombo_MER_468x.jpg?v=1695746491", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsGPu3BNdKW2w0q0gmUP0tuIV6esR3QvcjkQ&s"],
    user: User.all.sample
  },
  {
    title: "Zombie Walker Costume",
    description: "Rise from the grave with this terrifying zombie costume. Features tattered clothes, a rotting mask, and fake blood for that freshly undead look.",
    size: Costume::SIZE.sample,
    price: 4200,
    category: Costume::CATEGORIES.sample,
    image_url: ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJvDXOqWqKjOGAmJ5AvADfEcR2J76RVDNc7g&s"],
    user: User.all.sample
  },
  {
    title: "Royal Prince Costume",
    description: "Rule the kingdom in style with this royal prince costume. The outfit includes a regal velvet jacket, matching pants, a gold crown, and a scepter.",
    size: Costume::SIZE.sample,
    price: 4800,
    category: Costume::CATEGORIES.sample,
    image_url: ["https://images.halloweencostumes.com/media/13/prince/royal-prince-costume.jpg"],
    user: User.all.sample
  }
]

finished_costumes = []
costumes.each do |costume_hash|
   finished_costumes << costume = Costume.new({
    title: costume_hash[:title],
    description: costume_hash[:description],
    size: costume_hash[:size],
    price: costume_hash[:price],
    category: costume_hash[:category],
    user: costume_hash[:user]
  })
  costume.save!
  #, filename: "nes.png", content_type: "image/png"
  costume_hash[:image_url].each do |image_url|
    puts "attaching image..."
    file = URI.open(image_url)
    costume.photos.attach(io: file, filename: "costume.png")
  end

  costume.save
  20.times do
    start_date = Faker::Date.backward(days: 25)
    end_date = Faker::Date.between(from: start_date, to: start_date + 20.days)

    request = Request.new({
      costume: costume,
      user: User.where.not(costumes: costume).sample,
      status: Request.statuses.keys.sample,
      start_date: start_date,
      end_date: end_date,
    })
    request.save! # Save the request to the database

    # if request.completed?
    #   Review.create!({
    #     content: Faker::Lorem.sentence(word_count: 20),
    #     rating: rand(1..5), # Generate a random rating between 1 and 5
    #     user: request.user,
    #     request: request,
    #   })
    # end
  end
end

# puts finished_costumes

# key_users.each do |user|
#   puts "making #{user.username}'s requests"
#     start_date = Faker::Date.backward(days: 25)
#     end_date = Faker::Date.between(from: start_date, to: start_date + 20.days)
#   Request.create({
#     costume: finished_costumes.sample,
#     user: user,
#     status: Request.statuses.keys.sample,
#     start_date: start_date,
#     end_date: end_date,
#   })
# end

puts "created #{User.count} Users"
puts "created #{Costume.count} Costumes"
puts "created #{Request.count} Requests"
puts "created #{Review.count} Reviews"




Costume.create(title: 'Hatsune Miku', description: 'The Hatsune Miku costume features a teal, sleeveless dress with a pleated skirt, paired with matching thigh-high boots and detached arm sleeves, all adorned with digital-themed patterns and accents. The look is completed with her signature long, twin-tailed wig in vibrant aqua blue, along with a black and teal tie, and futuristic-looking headphones.', size: 'M', price: 1000, category: 'Anime', user_id: 2)
Costume.create(title: 'Banana', description: 'The banana costume is a bright yellow, full-body suit shaped like a ripe banana, complete with a pointed top and curved design for a playful, oversized appearance. It has openings for the face, arms, and legs, with a soft fabric material that ensures comfort and easy movement.', size: 'S', price: 2000, category: 'Scary', user_id: 1)
Costume.create(title: 'Dog', description: 'The dog costume is a cozy, full-body suit made of soft, plush fabric, designed to resemble a playful canine with floppy ears, a wagging tail, and a snout. It includes a hood with a detailed dog face, and the suit typically comes in various colors and patterns to mimic different dog breeds.', size: 'L', price: 3000, category: 'Animal', user_id: 1)
