class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_attached_file :book_cover, styles: { cover: '300x300>', preview: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :book_cover, content_type: /\Aimage\/.*\z/
 end
