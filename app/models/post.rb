class Post < ApplicationRecord
    has_rich_text :content
    has_one_attached :featured_image
    has_many :comments, dependent: :destroy
    
    validates :title, presence: true
    validates :content, presence: true
    
    scope :published, -> { where(published: true) }
    scope :recent, -> { order(created_at: :desc) }
  end