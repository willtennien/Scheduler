class CreateProjectSolutions < ActiveRecord::Migration
  def change
    create_table :project_solutions do |t|
    	t.integer :project_requirement_id
    	t.integer :user_id
    	t.integer :space_id
      	t.timestamps
    end
  end
end
