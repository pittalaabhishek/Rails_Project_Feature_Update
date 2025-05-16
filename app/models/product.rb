class Product < ActiveRecord::Base
  has_many :product_specs, dependent: :destroy
  accepts_nested_attributes_for :product_specs

  validates :name, presence: true
end