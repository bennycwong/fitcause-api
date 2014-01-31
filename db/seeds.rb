# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Mission.create([{name: "Goodwill", image: "goodwill.png", goal_points: 100, current_points: 10 }])
Mission.create([{name: "Greatwill", image: "greatwill.png", goal_points: 1000, current_points: 5000 }])
Mission.create([{name: "Badwill", image: "badwill.png", goal_points: 11231200, current_points: 123412 }])



