class CreateSoundproofnesses < ActiveRecord::Migration
	def change
		create_table :soundproofnesses do |t|
			t.string :name
			t.timestamps
		end
	end
end
