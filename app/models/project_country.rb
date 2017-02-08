class ProjectCountry < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :country
end