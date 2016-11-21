class AddLikeCountToProject < ActiveRecord::Migration
  def change
    add_column :projects, :like_count, :integer
  end
end
