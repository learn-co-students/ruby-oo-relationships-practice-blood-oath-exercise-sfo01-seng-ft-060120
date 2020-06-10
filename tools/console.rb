require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

telestic_shepherds = Cult.new("The Telestic Shepherds", "San Francisco", 1788, "The Strange Hex", 21)
supreme_wisdom = Cult.new("The Supreme Wisdom", "San Francisco", 1901, "The Act of the Unnatural Logic", 20)
holy_sky = Cult.new("The Holy Sky", "Seattle", 1788, "The Besseching of the Grim Energy", 19)

tommy = Follower.new("Tommy", 21, "White Ranger Power")
kimberly = Follower.new("Kimberly", 21, "Pink Ranger Power")
billy = Follower.new("Billy", 20, "Blue Ranger Power")
jason = Follower.new("Jason", 23, "Red Ranger Power")
zach = Follower.new("Zach", 22, "Black Ranger Power")
trini = Follower.new("Trini", 19, "Yellow Ranger Power")

b1 = Bloodoath.new(telestic_shepherds, tommy, "2019-06-01")
b2 = Bloodoath.new(telestic_shepherds, kimberly, "2020-05-30")
b3 = Bloodoath.new(supreme_wisdom, billy, "2020-04-20")
b4 = Bloodoath.new(supreme_wisdom, jason, "2020-05-01")
b5 = Bloodoath.new(holy_sky, zach, "2020-05-14")
b6 = Bloodoath.new(holy_sky, trini, "2020-05-20")
b8 = Bloodoath.new(supreme_wisdom, trini, "2020-06-06")
b9 = Bloodoath.new(supreme_wisdom, kimberly, "2020-06-07")
b10 = Bloodoath.new(holy_sky, kimberly, "2020-06-08")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits