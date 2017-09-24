# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_attached_file :book_cover, styles: { cover: '400x400>', preview: '200x200>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :book_cover, content_type: /\Aimage\/.*\z/
end
