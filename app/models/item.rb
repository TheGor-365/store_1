class Item < ApplicationRecord
  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true

  after_initialize { puts 'init' }
  after_save       { puts 'save' }
  after_create     { puts 'create' }
  after_update     { puts 'update' }
  after_destroy    { puts 'destroy' }

  # has_and_belongs_to_many :carts
  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable
  has_many :images, as: :imageable
  # has_and_belongs_to :orders
end
