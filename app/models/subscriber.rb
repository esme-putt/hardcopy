class Subscriber < ApplicationRecord
    belongs_to :user, optional: true
    
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true
    validates :token, uniqueness: true, allow_nil: true
    
    before_create :generate_token
    
    scope :active, -> { where(active: true) }
    
    private
    
    def generate_token
      self.token = SecureRandom.hex(10)
    end
  end