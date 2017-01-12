class CreateUserInstitutions < ActiveRecord::Migration
  def change
    create_table :user_institutions do |t|
      t.integer :user_id
      t.integer :institution_id
    end
  end
end
