class Like < ActiveRecord::Base
    belongs_to :user
    belongs_to :project
    
    #check for uniqueness: customer can only like/dislike project once
    # validates_uniqueness_of :user, scope: :project
end