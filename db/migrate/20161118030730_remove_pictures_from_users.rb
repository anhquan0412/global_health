class RemovePicturesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :pictures
  end
end
