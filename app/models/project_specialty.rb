class ProjectSpecialty < ActiveRecord::Base
  belongs_to :project
  belongs_to :specialty
end