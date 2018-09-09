# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
   author = Author.create(name: Faker::Name.name, bio: Faker::Company.catch_phrase , academics: Faker::Educator.degree, awards: Faker::Company.profession, profile_pic: Faker::Avatar.image )
    5.times.each_with_index do |i, index| 
        book = author.books.create()
        genres = rand(1..9).times.map { Genre::TYPE.sample }
        genres.each do |type|
        book.genres.create(name: type)
        end
    end
end

def book_reviews
    Book.all.limit(250).each do |book|
        book.reviews.create()        
    end
end
