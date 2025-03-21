class Product < ApplicationRecord
    has_many_attached :images
    has_rich_text :description
    
    validates :title, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :description, presence: true
    validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
    
    scope :available, -> { where('stock > 0') }
    scope :featured, -> { where(featured: true) }
  end
  