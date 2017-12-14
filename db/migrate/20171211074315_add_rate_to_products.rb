class AddRateToProducts < ActiveRecord::Migration
  def change

    add_column :users, :gender, :integer
    add_column :users, :ages, :integer
    add_column :users, :occupation, :string

  end
end
