class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
		t.integer :available_time_id
		t.string :name
		t.timestamps
    end
  end
end
