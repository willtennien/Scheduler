
class CreateInstrumentNames < ActiveRecord::Migration
  def change
    create_table :instrument_names do |t|
    	t.string :value
      t.timestamps
    end
  end
end
