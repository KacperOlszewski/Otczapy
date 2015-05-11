class CreateTypes < ActiveRecord::Migration

  def up
    create_table :types do |t|
    	t.string "name"
    	t.integer "position"
    	

      t.timestamps null: false
    end
  end
   def down
    drop_table :types
end
end
