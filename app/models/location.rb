class Location < ActiveRecord::Base
    belongs_to :project
    has_one :country
end
