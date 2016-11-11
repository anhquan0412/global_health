class User < ActiveRecord::Base
    validates :first_name, presence: true,
                    length: {minimum: 1, maximum: 50}
    validates :last_name, presence: true,
                    length: {minimum: 1, maximum: 50}
     
    # #check email validation
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
    validates :email, presence: true,
                    length: {maximum: 105},
                    #uniqueness: true ; if we do this, abc@a.com and ABC@a.com are different, but in fact they are not => have to ignore case sensitivity
                    uniqueness: {case_sensitive: false},
                    format: { with: VALID_EMAIL_REGEX }
    validates :phone_work, presence: true,
                    length: {minimum: 5, maximum: 50}
                    
    validates :institution, presence: true,
                    length: {minimum: 1, maximum: 100}
                    
    validates :status_id, presence: true
    
    # if no input for email description, set to unsubscribe
    
    
    #all of these table should be preloaded
    #one-to-many
    belongs_to :status
    belongs_to :country
    
    
    has_many :projects
    has_many :specialties, through: :user_specialties
    has_many :user_specialties, dependent: :destroy
    
    
    
    
    
end