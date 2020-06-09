require 'date'
class Cult
    attr_accessor :name, :location, :founding_year, :slogan, :minimum_age

    @@all = []

    def initialize (name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def recruit_follower(follower)
        if follower.age >= self.minimum_age
            Bloodoath.new(self, follower, Date.today.to_s)
        else 
            "You are too young to join this cult."
        end
    end

    def cult_bloodoaths
        Bloodoath.all.select { |bloodoath| bloodoath.cult == self }
    end

    def cult_population
        self.cult_bloodoaths.length
    end

    def average_age
        total_age = self.cult_bloodoaths.sum { |bloodoath| bloodoath.follower.age }
        total_age.to_f / cult_population
    end 

    def my_followers_mottos
        self.cult_bloodoaths.select { |bloodoath| puts bloodoath.follower.life_motto}
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find { |cult| cult.name == name }
    end

    def self.find_by_location(location)
        self.all.select { |cult| cult.location == location }
    end

    def self.find_by_founding_year(year)
        self.all.select { |cult| cult.founding_year == year }
    end 

    def self.least_popular
        self.all.min { |cult_a, cult_b| cult_a.cult_population <=> cult_b.cult_population}
    end

    def self.most_common_location
        locations = self.all.collect { |cult| cult.location}
        locations.max_by { |location| locations.count(location) }
    end
end