class Specialty < ActiveRecord::Base
    validates :name, presence: true
    
    has_many :projects, through: :project_specialties
    has_many :project_specialties, dependent: :destroy
    
    has_many :users, through: :user_specialties
    has_many :user_specialties, dependent: :destroy
    
    
end
