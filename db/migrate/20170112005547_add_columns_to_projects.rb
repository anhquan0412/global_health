class AddColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :contact_email, :string
    add_column :projects, :contact_phone, :string
  end
end
