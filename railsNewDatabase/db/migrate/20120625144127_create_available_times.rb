class CreateAvailableTimes < ActiveRecord::Migration
  def change
    create_table :available_times do |t|
    	t.integer :user_id
      t.timestamps
    end
  end
end
