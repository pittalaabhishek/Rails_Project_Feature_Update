class Product < ActiveRecord::Base
  has_many :product_specs

  validates :name, presence: true

  def destroy
    Product.transaction do
      ProductSpec.delete_all(product_id: id)
      
      super
    end
  end
end