class AddApprovalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :approved, :boolean, default: false
    add_column :projects, :approved, :boolean, default: false
  end
end
