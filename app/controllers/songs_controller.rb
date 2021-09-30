class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        erb :'songs/new'
    end


    get '/songs/:slug' do
        # binding.pry
        @song = Song.find_by_slug(params[:slug])
        song_genre = SongGenre.find_by(song_id: @song.id)
        genre_id = song_genre.genre_id
        @genre = Genre.find(genre_id)
        

        # binding.pry
        erb :'songs/show'
    end


end