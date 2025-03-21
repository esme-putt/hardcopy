class Order < ApplicationRecord
    belongs_to :user, optional: true
    has_many :order_items, dependent: :destroy
    has_many :products, through: :order_items
    
    enum status: { pending: 0, processing: 1, completed: 2, cancelled: 3 }
    
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :total_amount, presence: true, numericality: { greater_than: 0 }
  end