class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
    	t.integer :soundproofness_id
    	t.integer :user_id
    	t.integer :project_solution_id
      t.timestamps
    end
  end
end
