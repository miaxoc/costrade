# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(email: 'mia@gmail.com', username: 'mia', password: 'miamia')
User.create(email: 'yu@gmail.com', username: 'yu', password: 'yuyu')
User.create(email: 'akitaka@gmail.com', username: 'akitaka', password: 'akitakaakitaka')
User.create(email: 'max@gmail.com', username: 'max', password: 'maxmax')

Costume.create(title: 'Evangelion', description: 'cosplay costume for anime event', size: 'M', price: 1000, category: 'Anime', user_id: 1)
Costume.create(title: 'Banana', description: 'banana costume for banana event', size: 'S', price: 2000, category: 'Scary', user_id: 1)
Costume.create(title: 'Dog', description: 'dog costume for dog event', size: 'L', price: 3000, category: 'Animal', user_id: 1)
