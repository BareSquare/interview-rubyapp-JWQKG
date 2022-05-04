class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @people = Person.all
    @tags = ActsAsTaggableOn::Tag.all
  end

  def create
    movie_params = params[:movie].permit(:title, :description, :runtime)
    @movie = Movie.new(movie_params)
    @movie.save
    console

    @movie.genre_list.add(params["movie"]["genre_list"].reject{|g| g.empty?})
    @movie.save

    directors = params["movie"]["directors"].reject{|d| d.empty?}
    stars     = params["movie"]["stars"].reject{|s| s.empty?}
    writers   = params["movie"]["writers"].reject{|w| w.empty?}

    for d in directors
      @movie.directors.create!(person_id: d)
      @movie.save!
    end

    for s in stars
      @movie.stars.create!(person_id: s)
      @movie.save!
    end

    for w in writers
      @movie.writers.create!(person_id: w)
      @movie.save!
    end

    @movies = Movie.all
    render action: "index"
  end

  def edit
    @movie = Movie.find(params[:id])
    @people = Person.all
    @tags = ActsAsTaggableOn::Tag.all
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(params["movie"].permit(:title, :description, :runtime))

    @movie.genres.destroy_all

    @movie.genre_list.add(params["movie"]["genre_list"].reject{|g| g.empty?})
    @movie.save

    @movie.directors.destroy_all
    @movie.stars.destroy_all
    @movie.writers.destroy_all

    directors = params["movie"]["directors"].reject{|d| d.empty?}
    stars     = params["movie"]["stars"].reject{|s| s.empty?}
    writers   = params["movie"]["writers"].reject{|w| w.empty?}

    for d in directors
      @movie.directors.create!(person_id: d)
      @movie.save!
    end

    for s in stars
      @movie.stars.create!(person_id: s)
      @movie.save!
    end

    for w in writers
      @movie.writers.create!(person_id: w)
      @movie.save!
    end

    @movies = Movie.all
    render action: "index"
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    @movies = Movie.all
    render action: "index"
  end

  def import
    file = File.open(params[:file])
    data = JSON.parse(file.read)

    for m in data
      mm = Movie.new(title: m["title"], description: m["description"], runtime: m["runtime"])
      mm.save

      for s in m["stars"]
        p = Person.create!(first_name: s.split.first , last_name: s.split.last)
        mm.stars.create!(person_id: p.id)
      end

      for d in m["directors"]
        p = Person.create!(first_name: d.split.first , last_name: d.split.last)
        mm.directors.create!(person_id: p.id)
      end

      for w in m["writers"]
        p = Person.create!(first_name: w.split.first , last_name: w.split.last)
        mm.writers.create!(person_id: p.id)
      end

      for r in m["ratings"]
        mm.ratings.create(score: r)
      end

      mm.genre_list.add(m["genres"])
      mm.save!
    end

    @movies = Movie.all
    render action: "index"
  end
end
