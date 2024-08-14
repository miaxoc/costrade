# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Costume.destroy_all

User.create(email: 'mia@gmail.com', username: 'mia', password: 'miamia')
User.create(email: 'yu@gmail.com', username: 'yu', password: 'yuyu')
User.create(email: 'akitaka@gmail.com', username: 'akitaka', password: 'akitakaakitaka')
User.create(email: 'max@gmail.com', username: 'max', password: 'maxmax')

Costume.create(title: 'Hatsune Miku', description: 'The Hatsune Miku costume features a teal, sleeveless dress with a pleated skirt, paired with matching thigh-high boots and detached arm sleeves, all adorned with digital-themed patterns and accents. The look is completed with her signature long, twin-tailed wig in vibrant aqua blue, along with a black and teal tie, and futuristic-looking headphones.', size: 'M', price: 1000, category: 'Anime', user_id: 2)
Costume.create(title: 'Banana', description: 'The banana costume is a bright yellow, full-body suit shaped like a ripe banana, complete with a pointed top and curved design for a playful, oversized appearance. It has openings for the face, arms, and legs, with a soft fabric material that ensures comfort and easy movement.', size: 'S', price: 2000, category: 'Scary', user_id: 1)
Costume.create(title: 'Dog', description: 'The dog costume is a cozy, full-body suit made of soft, plush fabric, designed to resemble a playful canine with floppy ears, a wagging tail, and a snout. It includes a hood with a detailed dog face, and the suit typically comes in various colors and patterns to mimic different dog breeds.', size: 'L', price: 3000, category: 'Animal', user_id: 1)
