class AddStatusOtherToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status_other, :string
  end
end
