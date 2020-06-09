class Bloodoath
    attr_accessor :cult, :follower, :initiation_date

    @@all = []

    def initialize(cult, follower, initiation_date)
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        self.all.min { |oath_a, oath_b| oath_a.initiation_date <=> oath_b.initiation_date}
    end
end