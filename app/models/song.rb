class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    
    def slug
        slug = self.name.strip.gsub(/![^a-zA-Z]/, "").gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        @song = Song.where("name = '#{slug.titleize.gsub("-", " ")}'").first
    end

end