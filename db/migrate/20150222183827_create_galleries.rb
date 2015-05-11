class CreateGalleries < ActiveRecord::Migration
  def up
    create_table :galleries do |t|
        
        t.string "name"
    	t.integer "type_id"
        t.string "link"
    	t.integer "position"
    	t.attachment :img    	
        
      t.timestamps null: false
    end
        add_index("galleries", "type_id")
  end
  
   def down
       
    drop_table :galleries

  end
end