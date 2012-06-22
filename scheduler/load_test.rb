require_relative 'scheduler'
include TW2

# each of us makes 10 people, 3 demos
# times: [0..23]


# Jane Harmon plays lots of instruments but is very unavailable
janeH = Person.new("Jane Harmon", AvailableTime.new([[3, 4], [15, 16]]) )

inst1 = Instrument.new("Didgerido") #1/1 # last
inst2 = Instrument.new("Mandolin") #1/1 #last
inst3 = Instrument.new("Violin") #1/2
inst4 = Instrument.new("Viola") #1/2
inst5 = Instrument.new("Guitar") #1/4
inst6 = Instrument.new("Bass") #1/3

janeH.instruments.concat [inst1,inst2,inst3,inst4,inst5,inst6]
janeH.spaces.concat [(Space.new 1), (Space.new 0)]

# Tim Murphy only plays guitar (not valuable), but is free all the time
timM = Person.new("Tim Murphy", AvailableTime.new([[0, 23]]) ) # [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,23]]))

inst7 = Instrument.new("Guitar") #2/4

timM.instruments.concat [inst7]
timM.spaces.concat [(Space.new 5)]

# Colin Euling plays a couple instruments, and is free a few times (but never for too long)
colinE = Person.new("Colin Euling", AvailableTime.new([[3, 5], [7, 8], [11, 13], [15, 16], [19, 21]])) # [[3, 4, 5], [7, 8], [11, 12, 13], [15, 16], [19, 20, 21]]))

inst8 = Instrument.new("Violin") #2/2 # last
inst9 = Instrument.new("Guitar") #2/4

colinE.instruments.concat [inst8,inst9]
colinE.spaces.concat [(Space.new 5)]

# Tintin Herge plays a couple instruments, and is free for one long block
tintinH = Person.new("Tintin Herge", AvailableTime.new([[8, 15]])) # [[8, 9, 10, 11, 12, 13, 14, 15]]))

inst10 = Instrument.new("Bass") #2/3
inst11 = Instrument.new("Cymbals") # 1/3

tintinH.instruments.concat [inst10,inst11]
tintinH.spaces.concat [(Space.new 2)]

# Russell Jones plays 3 instruments, and is available a lot
russellJ = Person.new("Russell Jones", AvailableTime.new([[3, 6], [9, 12], [15, 18], [20, 23]])) # [[3, 4, 5, 6], [9, 10, 11, 12], [15, 16, 17, 18], [20, 21, 22, 23]]))

inst12 = Instrument.new("Cymbals") # 2/3
inst13 = Instrument.new("Guitar") # 3/4
inst14 = Instrument.new("Bass") # 3/3 #last

russellJ.instruments.concat [inst12,inst13,inst14]
russellJ.spaces.concat [(Space.new 5)]

# Molly Jones plays one instrument, and isn't very available
mollyJ = Person.new("Molly Jones", AvailableTime.new([[3, 4], [23, 24]]))

inst15 = Instrument.new("Guitar") # 4/4 # last

mollyJ.instruments.concat [inst15]
mollyJ.spaces.concat [(Space.new 2)]

# Zeke Allen does one not-rare thing, and as available a medium amount
zekeA = Person.new("Zeke Allen", AvailableTime.new([[5, 7], [11, 13], [15, 17], [20, 21]]) ) # [[5, 6, 7], [11, 12, 13], [15, 16, 17], [20, 21]))

inst16 = Instrument.new("Vocals") # 1/4

zekeA.instruments.concat [inst16]
zekeA.spaces.concat [(Space.new 1)]

# Devon Price does a non-rare thing, and is available at every time
devonP = Person.new("Devon Price", AvailableTime.new([[0, 23]]) )

inst17 = Instrument.new("Vocals") # 2/4

devonP.instruments.concat [inst17]
devonP.spaces.concat [(Space.new 3)]

# Chantal Pryor does one thing, is free a lot, but only for tiny blocks.
chantalP = Person.new("Chantal Pryor", AvailableTime.new([[1,2], [3, 4], [6, 9], [11, 14], [16, 19], [21,23]]) )  

inst18 = Instrument.new("Vocals") # 3/4

chantalP.instruments.concat [inst18]
chantalP.spaces.concat [(Space.new 2)]

# Sarah Silverman plays 3 things, and is available at irregular times (the start and and of the day)
sarahS = Person.new("Sarah Silverman", AvailableTime.new([[0, 5], [19, 23]])) # [[0, 1, 2, 3, 4], [19, 20, 21, 22, 23]]))

inst19 = Instrument.new("Cymbals") # last
inst20 = Instrument.new("Vocals") # last
inst21 = Instrument.new("Viola") # last

sarahS.instruments.concat [inst19,inst20,inst21]
sarahS.spaces.concat [(Space.new 1)] 


instruments_list_tom = [inst1, inst2, inst3, inst4, inst5, inst6, inst7, inst8, inst9, inst10, inst11, inst12, inst13, inst14, inst15, inst16, inst17, inst18, inst19, inst20, inst21]

people_list_tom = [janeH, timM, colinE, tintinH, russellJ, mollyJ, zekeA, devonP, chantalP, sarahS]





# crazyProject wants to use all instruments, and isn't available much. Only 2 hours (timblocks), though.

crazyProject = Demo.new({ :name => "crazyProject", 
  	                      :required_instruments => ["Didgerido", "Mandolin", "Violin", "Viola", "Cymbals", "Bass", "Guitar", "Vocals"],  
                          :required_space => 5, 
                          :schedule => AvailableTime.new([[3, 4], [8, 9], [15, 16], [20, 21]]),
                          :duration => 2
	                      })

#modestProject asks for 3 instruments (one rare) and is available for 2 long stretches. it takes 3 hours.
modestProject = Demo.new({ :name => "modestProject", 
	                         :required_instruments => ["Mandolin", "Bass", "Vocals"],  
                           :required_space => 0,
                           :schedule => AvailableTime.new([[5, 10], [14, 18]]),
                           :duration => 1
	                      })


# mediumProject wants a medium amount of instruments (4), and time (3). it's available pretty often. It's never free for longer than its requirement tho
mediumProject = Demo.new({ :name => "mediumProject", 
	                      :required_instruments => ["Violin", "Viola", "Guitar", "Vocals"],  
                          :required_space => 1,
                          :schedule => AvailableTime.new([[3, 5], [8, 10], [12, 14], [16, 18], [20, 22]]),
                          :duration => 2
	                      })


projects_list_tom = [crazyProject, modestProject, mediumProject]





##########################

# Jane Harmon plays lots of instruments but is very unavailable
janeH2 = Person.new("Jane Harmon2", AvailableTime.new([[3, 4], [15, 16]]) )

inst12 = Instrument.new("Didgerido") #1/1 # last
inst22 = Instrument.new("Mandolin") #1/1 #last
inst32 = Instrument.new("Violin") #1/2
inst42 = Instrument.new("Viola") #1/2
inst52 = Instrument.new("Guitar") #1/4
inst62 = Instrument.new("Bass") #1/3

janeH2.instruments.concat [inst12,inst22,inst32,inst42,inst52,inst62]
janeH2.spaces.concat [(Space.new 1), (Space.new 0)]

# Tim Murphy only plays guitar (not valuable), but is free all the time
timM2 = Person.new("Tim Murphy2", AvailableTime.new([[0, 23]]) ) # [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,23]]))

inst72 = Instrument.new("Guitar") #2/4

timM2.instruments.concat [inst72]
timM2.spaces.concat [(Space.new 5)]

# Colin Euling plays a couple instruments, and is free a few times (but never for too long)
colinE2 = Person.new("Colin Euling2", AvailableTime.new([[3, 5], [7, 8], [11, 13], [15, 16], [19, 21]])) # [[3, 4, 5], [7, 8], [11, 12, 13], [15, 16], [19, 20, 21]]))

inst82 = Instrument.new("Violin") #2/2 # last
inst92 = Instrument.new("Guitar") #2/4

colinE2.instruments.concat [inst82,inst92]
colinE2.spaces.concat [(Space.new 5)]

# Tintin Herge plays a couple instruments, and is free for one long block
tintinH2 = Person.new("Tintin Herge2", AvailableTime.new([[8, 15]])) # [[8, 9, 10, 11, 12, 13, 14, 15]]))

inst102 = Instrument.new("Bass") #2/3
inst112 = Instrument.new("Cymbals") # 1/3

tintinH2.instruments.concat [inst102,inst112]
tintinH2.spaces.concat [(Space.new 2)]

# Russell Jones plays 3 instruments, and is available a lot
russellJ2 = Person.new("Russell Jones2", AvailableTime.new([[3, 6], [9, 12], [15, 18], [20, 23]])) # [[3, 4, 5, 6], [9, 10, 11, 12], [15, 16, 17, 18], [20, 21, 22, 23]]))

inst122 = Instrument.new("Cymbals") # 2/3
inst132 = Instrument.new("Guitar") # 3/4
inst142 = Instrument.new("Bass") # 3/3 #last

russellJ2.instruments.concat [inst122,inst132,inst142]
russellJ2.spaces.concat [(Space.new 5)]

# Molly Jones plays one instrument, and isn't very available
mollyJ2 = Person.new("Molly Jones2", AvailableTime.new([[3, 4], [23, 24]]))

inst152 = Instrument.new("Guitar2") # 4/4 # last

mollyJ2.instruments.concat [inst152]
mollyJ2.spaces.concat [(Space.new 2)]

# Zeke Allen does one not-rare thing, and as available a medium amount
zekeA2 = Person.new("Zeke Allen2", AvailableTime.new([[5, 7], [11, 13], [15, 17], [20, 21]]) ) # [[5, 6, 7], [11, 12, 13], [15, 16, 17], [20, 21]))

inst162 = Instrument.new("Vocals") # 1/4

zekeA2.instruments.concat [inst162]
zekeA2.spaces.concat [(Space.new 1)]

# Devon Price does a non-rare thing, and is available at every time
devonP2 = Person.new("Devon Price2", AvailableTime.new([[0, 23]]) )

inst172 = Instrument.new("Vocals") # 2/4

devonP2.instruments.concat [inst172]
devonP2.spaces.concat [(Space.new 3)]

# Chantal Pryor does one thing, is free a lot, but only for tiny blocks.
chantalP2 = Person.new("Chantal Pryor2", AvailableTime.new([[1,2], [3, 4], [6, 9], [11, 14], [16, 19], [21,23]]) )  

inst182 = Instrument.new("Vocals") # 3/4

chantalP2.instruments.concat [inst182]
chantalP2.spaces.concat [(Space.new 2)]

# Sarah Silverman plays 3 things, and is available at irregular times (the start and and of the day)
sarahS2 = Person.new("Sarah Silverman2", AvailableTime.new([[0, 5], [19, 23]])) # [[0, 1, 2, 3, 4], [19, 20, 21, 22, 23]]))

inst192 = Instrument.new("Cymbals") # last
inst202 = Instrument.new("Vocals") # last
inst212 = Instrument.new("Viola") # last

sarahS2.instruments.concat [inst192,inst202,inst212]
sarahS2.spaces.concat [(Space.new 1)] 


instruments_list_tom = instruments_list_tom + [inst12, inst22, inst32, inst42, inst52, inst62, inst72, inst82, inst92, inst102, inst112, inst122, inst132, inst142, inst152, inst162, inst172, inst182, inst192, inst202, inst212]

people_list_tom = people_list_tom + [janeH2, timM2, colinE2, tintinH2, russellJ2, mollyJ2, zekeA2, devonP2, chantalP2, sarahS2]





# crazyProject wants to use all instruments, and isn't available much. Only 2 hours (timblocks), though.

crazyProject2 = Demo.new({ :name => "crazyProject2", 
                          :required_instruments => ["Didgerido", "Mandolin", "Violin", "Viola", "Cymbals", "Bass", "Guitar", "Vocals"],  
                          :required_space => 5, 
                          :schedule => AvailableTime.new([[3, 4], [8, 9], [15, 16], [20, 21]]),
                          :duration => 2
                        })

#modestProject asks for 3 instruments (one rare) and is available for 2 long stretches. it takes 3 hours.
modestProject2 = Demo.new({ :name => "modestProject2", 
                           :required_instruments => ["Mandolin", "Bass", "Vocals"],  
                           :required_space => 0,
                           :schedule => AvailableTime.new([[5, 10], [14, 18]]),
                           :duration => 1
                        })


# mediumProject wants a medium amount of instruments (4), and time (3). it's available pretty often. It's never free for longer than its requirement tho
mediumProject2 = Demo.new({ :name => "mediumProject2", 
                        :required_instruments => ["Violin", "Viola", "Guitar", "Vocals"],  
                          :required_space => 1,
                          :schedule => AvailableTime.new([[3, 5], [8, 10], [12, 14], [16, 18], [20, 22]]),
                          :duration => 2
                        })


projects_list_tom = projects_list_tom + [crazyProject2, modestProject2, mediumProject2]



#################



# crazyProject wants to use all instruments, and isn't available much. Only 2 hours (timblocks), though.

crazyProject3 = Demo.new({ :name => "crazyProject3", 
                          :required_instruments => ["Didgerido", "Mandolin", "Violin", "Viola", "Cymbals", "Bass", "Guitar", "Vocals"],  
                          :required_space => 5, 
                          :schedule => AvailableTime.new([[3, 4], [8, 9], [15, 16], [20, 21]]),
                          :duration => 2
                        })

#modestProject asks for 3 instruments (one rare) and is available for 2 long stretches. it takes 3 hours.
modestProject3 = Demo.new({ :name => "modestProject3", 
                           :required_instruments => ["Mandolin", "Bass", "Vocals"],  
                           :required_space => 0,
                           :schedule => AvailableTime.new([[5, 10], [14, 18]]),
                           :duration => 1
                        })


# mediumProject wants a medium amount of instruments (4), and time (3). it's available pretty often. It's never free for longer than its requirement tho
mediumProject3 = Demo.new({ :name => "mediumProject3", 
                        :required_instruments => ["Violin", "Viola", "Guitar", "Vocals"],  
                          :required_space => 1,
                          :schedule => AvailableTime.new([[3, 5], [8, 10], [12, 14], [16, 18], [20, 22]]),
                          :duration => 2
                        })


projects_list_tom = projects_list_tom + [crazyProject3, modestProject3, mediumProject3]

###################


#begin added by William
s = Scheduler.new people_list_tom, projects_list_tom # [crazyProject, modestProject, mediumProject]

# people_list_tom.each do |person|
#   instruments_list_tom.each do |instrument|
#     if instrument.person == person
#       person.instruments.push instrument
#     end
#   end
# end

s.calculate
#end added by William
