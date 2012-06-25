class CreateProjectRequirements < ActiveRecord::Migration
  def change
    create_table :project_requirements do |t|
    	t.integer :project_solution_id
    	t.integer :soundproofness_id
    	t.integer :user_id
      t.timestamps
    end
  end
end
