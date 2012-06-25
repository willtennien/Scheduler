class CreateInstrumentRequirements < ActiveRecord::Migration
  def change
    create_table :instrument_requirements do |t|
    	t.integer :instrument_name_id
    	t.integer :project_requirement_id
      t.timestamps
    end
  end
end
