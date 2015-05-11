class CreateCalendars < ActiveRecord::Migration

  def up
    create_table :calendars do |t|

    	t.string "name"
    	t.integer "position"
    	t.text "link"

      t.timestamps null: false
    end


  end
   def down
    drop_table :calendars

end
end
