class ArtistsController < ApplicationController

    get '/artists' do
        @artists = Artist.all
        erb :'artists/index'
    end

    get '/artists/:slug' do 
        @artist = Artist.find_by_slug(params[:slug])
        # binding.pry
        @songs = Song.all.find_all {|song| song.artist_id == @artist.id}
        @song_genres = []
        @songs.collect do |song|
            @song_genres << SongGenre.all.find_all {|sg| sg.song_id == song.id}
        end
        @genres = []
        @song_genres.collect do |sg|
            # binding.pry
            @genres << Genre.find {|genre| genre.id == sg[0].genre_id}
        end
        
        erb :'artists/show'
    end
end
