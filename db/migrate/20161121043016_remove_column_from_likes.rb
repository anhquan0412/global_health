class RemoveColumnFromLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :like
  end
end
