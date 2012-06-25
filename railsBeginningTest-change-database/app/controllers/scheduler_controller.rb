require_relative '../../scheduler/scheduler'

class SchedulerController < ApplicationController

	def load
		people = []
		User.all.each do |user|
			instruments = []
			Instrument.all.each do |instr|
				instruments.push (TW2::Instrument.new instr.instrument_name.value) if instr.user == user
			end
			spaces = []
			Space.all.each do |sp|
				spaces.push (TW2::Space.new sp.soundproofness.to_i) if sp.user == user
			end

			p = TW2::Person.new user.name (TW2::AvailableTime.new user.availability.value)
			p.instruments.concat instruments
			p.spaces.concat spaces
			people.push p
		end

		demos = []
		ProjectRequirement.all.each do |req|
			time = TW2::AvailableTime.new req.user.availability.value

			instruments = []
			req.instruments.each do |instr|
				instruments.push(TW2::Instrument.new instr.name)
			end

			demos.push TW2::Demo.new(name: req.name,
									 duration: req.duration,
									 schedule: time,
								 	 required_instruments: instruments,
									 required_space: req.space)
		end

		@s = TW2::Scheduler.new people demos
	end

	def calculate
		@s.calulate
	end
end