# Add seed data here. Seed your database with `rake db:seed`
songs_list = {
    "Bad Romance" => {
      :artist_id => 1
    },
    "Shape of You" => {
      :artist_id => 2
    }
  }

songs_list.each do |name, songs_hash|
  p = Song.new
  p.name = name
  songs_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end

artists_list = {
    "Lady Gaga" => {
    },
    "Ed Sheeren" => {
    }
  }

artists_list.each do |name, artists_hash|
  p = Artist.new
  p.name = name
  p.save
end


genres_list = {
    "Old Pop" => {
    },
    "New Pop" => {
    }
  }

genres_list.each do |name, genre_hash|
  p = Genre.new
  p.name = name
  p.save
end