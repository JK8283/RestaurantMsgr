class CreateTwils < ActiveRecord::Migration
  def change
    create_table :twils do |t|
    	t.string :name
    	t.string :phone
    	t.timestamps
      t.timestamps
    end
  end
end
