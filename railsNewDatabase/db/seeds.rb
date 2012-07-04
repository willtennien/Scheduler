# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
InstrumentName.create_all
Soundproofness.create_all

u1 = User.create(username: "user1",
				password: "secret",
				name: "bob",
				email: "bob@genericnames.com")

a1 = AvailableTime.create(user_id: u1.id)
a1.value = [[1,2]]
a1.save

i1 = Instrument.create(instrument_name: InstrumentName.find_by_value("guitar"),
					   user_id: u1.id)

sp1 = Space.create(soundproofness: Soundproofness.find_by_name("quiet"),
				   user_id: u1.id)


p1 = ProjectRequirement.create(name: "projectOne",
							   description: "This is a description.",
							   duration: 1,
							   soundproofness: Soundproofness.find_by_name("quiet"),
							   user_id: u1.id)

p1.instrument_requirements.push InstrumentRequirement.create(instrument_name: InstrumentName.find_by_value("guitar"))
