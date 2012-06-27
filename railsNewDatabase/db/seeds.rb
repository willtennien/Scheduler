# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.new(username: "user1",
			  password: "secret")

a1 = AvailableTime.new(value: [[1,2]],
					   user: u1)

i1 = Instrument.new(instrument_name: InstrumentName.new(value: "guitar"),
					user: u1)

sp1 = Space.new(soundproofness: Soundproofness.new(name: "quiet").id)


p1 = ProjectRequirement.new(name: "projectOne",
							description: "This is a description.",
							duration: 1,
							soundproofness: Soundproofness.new(name: "quiet"),
							user: u1)

p1.instrument_requirements.push InstrumentRequirement.new(instrument_name: InstrumentName.new(value: 'guitar'))