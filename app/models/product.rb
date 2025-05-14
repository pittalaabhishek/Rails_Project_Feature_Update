class Product < ActiveRecord::Base
  has_many :product_specs

  validates :name, presence: true
  # before_destroy :delete_specs

  def destroy
    # Start a transaction
    Product.transaction do
      # First delete all associated product_specs
      ProductSpec.delete_all(product_id: id)
      
      # Then delete the product itself
      super
    end
  end

  # private
  
  # def delete_specs
  #   ProductSpec.delete_all(product_id: id)
  # end
end