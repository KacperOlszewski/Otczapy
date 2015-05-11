class CreateMovies < ActiveRecord::Migration

  def up
    create_table :movies do |t|
    	t.string "name"
    	t.integer "position"
    	t.text "link"

      t.timestamps null: false
    end
  end
   def down
    drop_table :movies
end
end
