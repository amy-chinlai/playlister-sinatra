class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        slug = self.name.strip.gsub(/![^a-zA-Z]/, "").gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        @artist = Artist.where("name = '#{slug.titleize.gsub("-", " ")}'").first
    end

end