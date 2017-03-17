class User < ActiveRecord::Base
    validates :first_name, presence: true,
                    length: {minimum: 1, maximum: 50}
    validates :last_name, presence: true,
                    length: {minimum: 1, maximum: 50}

    # #check email validation
    before_save { self.email = self.email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true,
                    length: {maximum: 100},
                    #uniqueness: true ; if we do this, abc@a.com and ABC@a.com are different, but in fact they are not => have to ignore case sensitivity
                    uniqueness: {case_sensitive: false},
                    format: { with: VALID_EMAIL_REGEX }
    validates :phone_work,
                    length: {maximum: 50}

                    
    validates :institution_other,
                    length: {maximum: 100}
                    

    # validates :status_id, presence: true
    validates :status_other, length: {maximum: 20}


    validates :prefix, length: {maximum: 8}
    validates :suffix, length: {maximum: 8}
    validates :address, length: {maximum: 50}
    validates :city, length: {maximum: 20}
    validates :state, length: {maximum: 20}

    # if no input for email description, set to unsubscribe

    
    #all of these table should be preloaded
    #one-to-many
    belongs_to :status

    # belongs_to :country
    
    #1 to many relationship with project
    has_many :projects
    
    #many to many relationship with specialty
    has_many :specialties, through: :user_specialties
    has_many :user_specialties, dependent: :destroy

    has_many :likes, dependent: :destroy

    #many to many relationship with institution
    has_many :institutions, through: :user_institutions
    has_many :user_institutions, dependent: :destroy
    

     #password authentication
    has_secure_password

    mount_uploader :picture, ProfileUploader

    def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
    end

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
    
    
    
    # Demonstration of using a "ransacker" (a virtual, searchable "column") to
  # allow searching via the full name from concatenated first and last names.
  #
    ransacker :full_name do |parent|
      Arel::Nodes::InfixOperation.new('||',
        Arel::Nodes::InfixOperation.new('||',
          parent.table[:first_name], Arel::Nodes.build_quoted(' ')),
        parent.table[:last_name])
    end
    
    
    def self.institution_subquery(institution_ids)
      users = Arel::Table.new(:users)
      institutions = Arel::Table.new(:institutions)
      user_institutions = Arel::Table.new(:user_institutions)
      users[:id].in(
      users.project(users[:id])
        .join(user_institutions).on(users[:id].eq(user_institutions[:user_id]))
        .join(institutions).on(user_institutions[:institution_id].eq(institutions[:id]))
        .where(institutions[:id].in(institution_ids))
        .group(users[:id])
        .having(institutions[:id].count.eq(institution_ids.length))
      ).to_sql
    end
    
end
