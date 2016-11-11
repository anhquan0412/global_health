class Specialty < ActiveRecord::Base
    validate :name, presence: true
    
    has_many :projects, through: :project_specialties
    has_many :project_specialties, dependent: :destroy
    
    has_many :users, through: :user_specialties
    has_many :user_specialties, dependent: :destroy
    
    
end
