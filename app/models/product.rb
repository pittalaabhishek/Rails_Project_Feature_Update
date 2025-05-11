class Product < ActiveRecord::Base
  serialize :product_attributes, Hash
end