class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
    	t.string :name
    	t.string :phone
    	t.integer :partysize
    	t.integer :waitminutes
    	t.string :seating_time
      	t.timestamps
    end
  end
end
