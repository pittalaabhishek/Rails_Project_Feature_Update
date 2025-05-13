class Product < ActiveRecord::Base
  serialize :product_attributes, Hash

  validates :name, presence: true
end