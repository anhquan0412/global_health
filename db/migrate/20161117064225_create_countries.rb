class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :alpha_2
      t.string :alpha_3
    end
  end
end
