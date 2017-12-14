class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text        :text
      t.integer     :rate
      t.integer     :from_user_id
      t.integer     :to_user_id
      t.timestamps null: false
    end
  end
end
