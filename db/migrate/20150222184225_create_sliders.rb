class CreateSliders < ActiveRecord::Migration

  def up
    create_table :sliders do |t|

      t.string "name"
      t.string "text"
    	t.integer "position"
    	t.attachment :img

      t.timestamps null: false
    end

  end
   def down
    drop_table :sliders

  end
end