class Product < ActiveRecord::Base
  has_many :product_specs, dependent: :destroy

  validates :name, presence: true
end