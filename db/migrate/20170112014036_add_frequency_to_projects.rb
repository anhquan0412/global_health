class AddFrequencyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :frequency, :string
  end
end
