class Status < ActiveRecord::Base
    has_many :users
    
    validate :name, presence: true
end
