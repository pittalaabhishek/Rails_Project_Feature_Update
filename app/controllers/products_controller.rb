class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.product_specs.build
  end

  def index
    @products = Product.all
  end

  
  def create
    @product = Product.new(product_params)
    
    if params[:add_more_attributes]
      @product.product_specs.build
      render :new
    else
      @product.product_specs = @product.product_specs.reject do |spec|
        spec.key.blank? || spec.value.blank?
      end
  
      if @product.save
        redirect_to products_path
      else
        @product.product_specs.build if @product.product_specs.empty?
        render :new
      end
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:name, product_specs_attributes: [:key, :value])
  end
end