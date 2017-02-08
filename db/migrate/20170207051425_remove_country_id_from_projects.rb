class RemoveCountryIdFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :country_id
  end
end
