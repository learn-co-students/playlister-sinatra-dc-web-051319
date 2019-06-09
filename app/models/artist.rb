# frozen_string_literal: true

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub(/\W/, '-')
  end

  def self.find_by_slug(slug)
    all.select do |artist|
      artist.slug == slug
    end.first
  end
end
