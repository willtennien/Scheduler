# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a1 = AvailableTime.new
a1.value = [[1,2]]

p1 = ProjectRequirement.new
p1.name = "projectOne"
p1.duration = 1
p1.schedule = a1
p1.required_instruments = #...
p1.required_spaces = #...