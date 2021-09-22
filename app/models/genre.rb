class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        slug = self.name.strip.gsub(/![^a-zA-Z]/, "").gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        @song = Genre.where("name = '#{slug.titleize.gsub("-", " ")}'").first
    end

end