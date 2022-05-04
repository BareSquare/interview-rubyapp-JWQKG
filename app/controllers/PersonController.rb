class PersonController < ApplicationController
  def show
    @person = Person.find(params[:id])

    @star = Movie.joins(:stars).where(:stars => {:person_id => @person.id})
    @director = Movie.joins(:directors).where(:directors => {:person_id => @person.id})
    @writer = Movie.joins(:writers).where(:writers => {:person_id => @person.id})

  end
end
