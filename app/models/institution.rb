class Institution < ActiveRecord::Base
    validates :name, presence: true
    
    has_many :users, through: :user_institutions
    has_many :user_institutions, dependent: :destroy
    
    
end
