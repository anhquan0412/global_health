class CreateProjectCountries < ActiveRecord::Migration
  def change
    create_table :project_countries do |t|
      t.integer :project_id
      t.integer :country_id
    end
  end
end
