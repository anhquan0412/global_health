class Location < ActiveRecord::Base
    belongs_to :project
    has_one :country

    validates :project_id, presence: true
end
