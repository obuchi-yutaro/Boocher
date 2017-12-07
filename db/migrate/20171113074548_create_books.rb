class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|

      t.string 		:genre
      t.string		:title
      t.string		:author
      t.text		:text
      t.text		:image
      t.integer		:user_id
      t.timestamps 
    end
  end
end
