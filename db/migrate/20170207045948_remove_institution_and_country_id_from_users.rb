class RemoveInstitutionAndCountryIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :institution
    #just kidding; only remove institution string. Keep country id
  end
end
