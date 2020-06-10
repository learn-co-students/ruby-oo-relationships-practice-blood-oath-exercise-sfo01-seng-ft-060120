require 'date'

class Follower
    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize (name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults 
        bloodoaths = Bloodoath.all.select { |bloodoath| bloodoath.follower == self }
        bloodoaths.collect { |bloodoath| bloodoath.cult }
    end

    def join_cult(cult)
        if self.age >= cult.minimum_age
            Bloodoath.new(cult, self, Date.today.to_s)
        else
            "You are too young to join this cult."
        end
    end

    def my_cults_slogans
        self.cults.select { |cult| puts cult.slogan }
    end

    def fellow_cult_members
        members = []
        self.cults.collect do |cult|
            Bloodoath.all.each do |bloodoath|
                if bloodoath.cult == cult
                    members << bloodoath
                end
            end
        end
        members.collect { |bloodoath| bloodoath.follower }.uniq
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.select { |follower| follower.age >= age}
    end

    def self.most_active
        self.all.max { |follower_a, follower_b| follower_a.cults.length <=> follower_b.cults.length}
    end

    def self.top_ten
        self.all.max(10) { |follower_a, follower_b| follower_a.cults.length <=> follower_b.cults.length}
    end
end
