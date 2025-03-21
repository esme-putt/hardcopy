class User < ApplicationRecord
    has_secure_password
    has_many :orders
    has_many :comments
    has_many :subscribers
    
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true
    
    enum :role, { customer: 0, admin: 1 }
  end