class CreateWorkshops < ActiveRecord::Migration
  
  def up
    create_table :workshops do |t|

    	t.string "name"
    	t.string   "link"
    	t.string  "place"
    	t.string  "date"
    	t.integer "position"
      t.text "text"
    	t.attachment :img
      t.attachment :file
      
      t.timestamps null: false
    end

  end
    def down
      drop_table :workshops

    end

end
