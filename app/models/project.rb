class Project < ActiveRecord::Base
    validates :name, presence: true,
                length: {minimum: 1, maximum: 50}
    
    validates :description, presence: true,
                length: {maximum: 5000}
                
    belongs_to :country
    belongs_to :user
    

end