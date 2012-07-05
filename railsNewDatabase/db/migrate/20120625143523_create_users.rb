class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
		t.integer :available_time_id
		t.string :username
    t.string :password
    t.string :password_digest
    t.string :name
    t.string :email
    t.string :bio
		t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end