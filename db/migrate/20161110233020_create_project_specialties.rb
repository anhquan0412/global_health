class CreateProjectSpecialties < ActiveRecord::Migration
  def change
    create_table :project_specialties do |t|
      t.integer :project_id
      t.integer :specialty_id
    end
  end
end
