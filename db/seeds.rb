# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'net/http'
require 'json'
require 'date'

url = "http://api.tvmaze.com/search/shows?q=house"
uri = URI(url)
response = Net::HTTP.get(uri)

top_three_shows = JSON.parse(response).max_by(3) {|show| show["show"]["rating"]["average"].to_f}
description = [
    "An antisocial maverick doctor does whatever it takes to solve puzzling cases.",
    "With the help of his right-hand man Clyde, Lincoln finds new ways to survive in such a large family.",
    "A married ex police couple turn their remote Guest House into a Safe House."
    ]

top_three_shows.each_with_index do |show, i|
    HouseShow.create(
        name: show["show"]["name"],  
        photo: show["show"]["image"]["medium"],
        rating: show["show"]["rating"]["average"],
        release_date: Date.strptime(show["show"]["premiered"]), 
        description: description[i]
    )
end
