class CreatePosts < ActiveRecord::Migration

  def up
    create_table :posts do |t|

    	t.string "name"
    	t.string  "teaser"
    	t.string   "link"
    	t.integer "position"
      t.text "text"
    	t.attachment :img
      t.attachment :file
      
      t.timestamps
    end

  end
    def down
      drop_table :posts

    end

end
