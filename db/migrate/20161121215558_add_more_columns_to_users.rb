class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address_type, :integer
    add_column :users, :zipcode, :integer
    remove_column :users, :admin
  end
end
