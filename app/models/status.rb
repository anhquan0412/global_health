class Status < ActiveRecord::Base
    has_many :users
    
    validates :name, presence: true
end
