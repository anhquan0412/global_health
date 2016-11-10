class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :specialty_id
    remove_column :users, :subscribe_id
  end
end
