# frozen_string_literal: true

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.downcase.gsub(/\W/, '-')
  end

  def self.find_by_slug(slug)
    all.select do |artist|
      artist.slug == slug
    end.first
  end
end
