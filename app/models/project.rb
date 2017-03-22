class Project < ActiveRecord::Base
    validates :name, presence: true,
                length: {maximum: 100}

    validates :description,
                length: {maximum: 5000}

    #validates date
    validates :start_date, presence: true

    validates :frequency, presence: true

    # validates :country_id, presence: true
    #TODO: write a function to validate country_ids[] length >=1, or choose at least one country

    validates :user_id, presence: true


     # #check email validation
    before_save { self.contact_email = self.contact_email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :contact_email, presence: true,
                    length: {maximum: 100},
                    #uniqueness: true ; if we do this, abc@a.com and ABC@a.com are different, but in fact they are not => have to ignore case sensitivity
                    format: { with: VALID_EMAIL_REGEX }
    validates :contact_phone,
                    length: {maximum: 50}



    belongs_to :user

    #many to many relationship with specialty
    has_many :specialties, through: :project_specialties
    has_many :project_specialties, dependent: :destroy

    #many to many relationship with country
    has_many :countries, through: :project_countries
    has_many :project_countries, dependent: :destroy


    has_many :likes, dependent: :destroy

    has_many :locations, dependent: :destroy

    mount_uploader :picture, PictureUploader #PictureUploader is name of the class in picture_uploader.rb
    validate :picture_size #check pics size


    mount_uploader :document, DocumentUploader # Tells rails to use this uploader for this model.
    validate :document_size


    #order the recipe by update time
    default_scope -> {order(created_at: :desc)}



    private
        def picture_size
          if picture.size > 4.megabytes
            errors.add(:picture, "should be less than 4 MB")
          end
        end

        def document_size
          if document.size > 4.megabytes
            errors.add(:document, "should be less than 4 MB")
          end
        end


end
