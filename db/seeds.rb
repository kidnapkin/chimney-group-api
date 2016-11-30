# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
  title = Faker::Book.title
  description = Faker::Lorem.sentence(5)
  thumbnail = Faker::File.file_name("uploads/#{Post.class.to_s.underscore}/fun/#{n}")
  media = Faker::File.file_name("uploads/#{Post.class.to_s.underscore}/fun/#{n}")
  type = Faker::Boolean.boolean ? :audio : :video
  
  Post.create!(title:  title,
               description:  description,
               thumbnail:   thumbnail,
               media: media,
               media_type: type)
end