class ProductSpec < ActiveRecord::Base
  belongs_to :product
  validates :key, presence: true
  validates :value, presence: true

  validates :product, presence: true
end