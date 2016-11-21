class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :state, :string
    add_column :users, :country_id, :integer
    
    remove_column :users, :zipcode
    remove_column :users, :address_type
  end
end
