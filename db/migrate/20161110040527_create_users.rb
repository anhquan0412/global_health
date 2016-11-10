class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :prefix
      t.string :first_name
      t.string :last_name
      t.string :suffix
      t.string :address_type
      t.text :address
      t.string :city
      t.string :zipcode
      t.string :email
      t.string :phone_work
      t.string :phone_mobile
      t.string :fax_number
      t.string :institution
      t.integer :status_id
      t.integer :specialty_id
      t.integer :subscribe_id
      t.boolean :admin
      t.string :pictures
      t.timestamps
    end
  end
end
