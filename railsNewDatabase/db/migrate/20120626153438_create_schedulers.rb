class CreateSchedulers < ActiveRecord::Migration
	def change
		create_table :schedulers do |s|
			s.integer :id
			s.string :name
			s.timestamps
		end
	end
end
