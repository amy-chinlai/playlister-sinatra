require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash
    enable :sessions

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    post '/songs' do
        @song = Song.create(name: params[:Name])
        @song.artist = Artist.find_or_create_by(name: params[:artist_name])
        @genre = Genre.find_by_id(params[:genres][0].to_i)
        @song.song_genres.create(genre: @genre)
        @song.save
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        # binding.pry
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.name = params[:Name]
        @song.artist = Artist.find_or_create_by(name: params[:artist_name])
        @song.genre_ids = params[:genres]
        @song.save
        # binding.pry
        flash[:message] = "Successfully updated song."
        redirect to "/songs/#{@song.slug}"
    end


    get '/songs/:slug' do
        # binding.pry
        @song = Song.find_by_slug(params[:slug])
        # song_genre = SongGenre.find_by(song_id: @song.id)
        # genre_id = song_genre.genre_id
        # @genre = Genre.find_by_id(genre_id)
        

        # binding.pry
        erb :'songs/show'
    end


end