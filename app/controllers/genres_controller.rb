class GenresController < ApplicationController

    get '/genres' do
        @genres = Genre.all
        erb :'genres/index'
    end

    get '/genres/:slug' do
        @genre = Genre.find_by_slug(params[:slug])
        @song_genre = SongGenre.all.find_all {|sg| @genre.id == sg.genre_id }
        @songs = []
        @song_genre.collect do |sg|
            @songs << Song.all.find_all {|song| sg.song_id == song.id }
        end
        @artists = []
        @songs.collect do |song|
            @artists << Artist.all.find_all {|artist| artist.id = song[0].artist_id }
        end
        # binding.pry
        erb :'genres/show'
    end

end