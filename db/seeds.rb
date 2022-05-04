# Destroy all
Person.destroy_all
Movie.destroy_all
Rating.destroy_all
Star.destroy_all
Director.destroy_all
Writer.destroy_all
ActsAsTaggableOn::Tag.destroy_all

# Create people
200.times do |index|
  Person.create!(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.unique.last_name)
end

@genres = ["action", "horror", "sci-fi", "comedy", "romance", "adventure", "thriller", "drama", "animation"]

# Create movies
150.times do |index|
  movie = Movie.create!(title: Faker::Movie.unique.title,
                        description: Faker::Lorem.paragraph,
                        runtime: rand(60...180))

  movie.genre_list.add(@genres.sample(rand(1...3)))
  movie.save

  stars = Person.find(Person.pluck(:id).sample(rand(2...6)))
  directors = Person.find(Person.pluck(:id).sample(rand(1...2)))
  writers =  Person.find(Person.pluck(:id).sample(rand(1...3)))

  stars.each do |star|
    movie.stars.create!(person_id: star.id)
  end

  directors.each do |director|
    movie.directors.create!(person_id: director.id)
  end

  writers.each do |writer|
    movie.writers.create!(person_id: writer.id)
  end

  30.times do |index|
    movie.ratings.create(score: rand(0.0..10.0).round(1))
  end

end
