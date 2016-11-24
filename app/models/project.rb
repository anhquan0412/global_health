class Project < ActiveRecord::Base
    validates :name, presence: true,
                length: {maximum: 100}
    
    validates :description, presence: true,
                length: {maximum: 5000}
    
    #validates date
    validates :start_date, presence: true
    validates :end_date, presence: true
    
    
    validates :country_id, presence: true
    validates :user_id, presence: true
        
                
    belongs_to :country
    belongs_to :user
    
    has_many :specialties, through: :project_specialties
    has_many :project_specialties, dependent: :destroy
    
    has_many :likes, dependent: :destroy
    
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