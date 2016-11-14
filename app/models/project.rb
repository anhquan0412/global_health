class Project < ActiveRecord::Base
    validates :name, presence: true,
                length: {minimum: 1, maximum: 50}
    
    validates :description, presence: true,
                length: {maximum: 5000}
    
    #validates date
    validates :country_id, presence: true
    validates :user_id, presence: true
                
    belongs_to :country
    belongs_to :user
    
    has_many :specialties, through: :project_specialties
    has_many :project_specialties, dependent: :destroy
    
    

end