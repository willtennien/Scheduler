class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
    	t.integer :user_id
    	t.integer :instrument_name_id
    	t.integer :project_solution_id
      	t.timestamps
    end
  end
end
