class User < ActiveRecord::Base
    validates :first_name, presence: true,
                    length: {minimum: 1, maximum: 50}
    validates :last_name, presence: true,
                    length: {minimum: 1, maximum: 50}
     
    # #check email validation
    before_save { self.email = self.email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
    validates :email, presence: true,
                    length: {maximum: 100},
                    #uniqueness: true ; if we do this, abc@a.com and ABC@a.com are different, but in fact they are not => have to ignore case sensitivity
                    uniqueness: {case_sensitive: false},
                    format: { with: VALID_EMAIL_REGEX }
    validates :phone_work,
                    length: {maximum: 50}
                    
    validates :institution,
                    length: {maximum: 100}
                    
    # validates :status_id, presence: true
    validates :status_other, length: {maximum: 20}
    
    
    validates :prefix, length: {maximum: 8}
    validates :suffix, length: {maximum: 8}
    validates :address, length: {maximum: 50}
    validates :city, length: {maximum: 20}
    validates :state, length: {maximum: 20}
    
    # if no input for email description, set to unsubscribe
    
    
    #all of these table should be preloaded
    #one-to-many
    belongs_to :status
    belongs_to :country
    
    
    has_many :projects
    has_many :specialties, through: :user_specialties
    has_many :user_specialties, dependent: :destroy
    
    has_many :likes, dependent: :destroy
    
    has_many :institutions, through: :user_institutions
    
     #password authentication
    has_secure_password  
    
    mount_uploader :picture, ProfileUploader
    
end