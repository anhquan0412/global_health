class AddDocumentToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :document, :string
  end
end
