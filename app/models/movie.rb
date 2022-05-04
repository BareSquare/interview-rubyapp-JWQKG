class Movie < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :genres
  acts_as_tagger

  has_many :stars
  has_many :directors
  has_many :writers
  has_many :ratings
end
