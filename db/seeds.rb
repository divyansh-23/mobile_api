# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "divyansh@example.com", password: '123456789')

100.times do
   author = Author.create(name: Faker::Book.author, bio: Faker::Company.catch_phrase , academics: Faker::Educator.degree, awards: Faker::Military.army_rank, profile_pic: Faker::Avatar.image )
    5.times.each_with_index do |i, index| 
        book = author.books.create(name: Faker::Book.title, short_description: Faker::ChuckNorris.fact, long_description: Faker::Buffy.quote, chapter_index: Faker::Types.rb_integer, publication_date: Faker::Date.backward(27))
        genres = rand(1..9).times.map { Genre::TYPE.sample }
        genres.each do |type|
        book.genres.create(name: type)
        end
    end
end


Book.all.limit(250).each do |book|
    book.reviews.create(reviewer_name: Faker::Name.name, rating: Faker::ChileRut.check_digit, review_title: Faker::Buffy.episode, review_description: Faker::Buffy.quote)
end
