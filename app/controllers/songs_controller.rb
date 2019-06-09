# frozen_string_literal: true

require 'rack-flash'
require 'sinatra/base'

class SongsController < ApplicationController
  set :views, proc { File.join(root, '../views/songs') }
  set :method_override, true
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  post '/songs' do
    song = Song.new
    name = params[:song_name]
    artist = params[:artist_name]
    genres = params[:genres]

    song.name = name
    song.artist = Artist.find_or_create_by(name: artist)
    song.genres = Genre.find(genres)

    song.save

    flash[:message] = 'Successfully created song.'
    redirect "/songs/#{song.slug}"
  end

  get '/songs/new' do
    erb :new
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    name = params[:song_name]
    artist = params[:artist_name]
    genres = params[:genres]

    song.name = name
    song.artist = Artist.find_or_create_by(name: artist)
    song.genres = Genre.find(genres)

    song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end
end
