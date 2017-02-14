class AddInstitutionOtherToUsers < ActiveRecord::Migration
  def change
    add_column :users, :institution_other, :string
  end
end
