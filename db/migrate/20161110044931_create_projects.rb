class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :country_id
      t.string :website
      t.boolean :immediate
      # t.text :file
      t.timestamps
    end
  end
end
