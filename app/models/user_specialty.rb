class UserSpecialty < ActiveRecord::Base
  belongs_to :user
  belongs_to :specialty
end