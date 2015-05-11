class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|

      t.integer "position"
    	t.string "name", :limit=>20
    	t.string "surname", :limit=>40
    	t.string "user", :limit=>40
    	t.string "link"
      t.text "text"
    	t.attachment :img
    	t.string "email", :limit=>80, :default=>"", :null=>false
    	t.string "password_digest"

      t.timestamps null: false
    end

    add_index("users", "user")
  end

	def down
		drop_table :users

 end
end
