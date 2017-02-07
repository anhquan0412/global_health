class Country < ActiveRecord::Base

    has_many :projects, through: :project_countries
    has_many :project_countries, dependent: :destroy
end