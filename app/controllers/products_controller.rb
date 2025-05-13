class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.product_attributes ||= {}
  end

  def index
    @products = Product.all
  end

  def create
    if params[:add_more_attributes]
      attributes = params[:product][:product_attributes] || []
      attributes << { "key" => "", "value" => "" }
      params[:product][:product_attributes] = attributes
      @product = Product.new(product_params)
      render :new
    else
      raw_attributes = params[:product][:product_attributes] || []
      transformed_attributes = raw_attributes.each_with_object({}) do |attr, hash|
        next if attr["key"].blank?
        hash[attr["key"]] = attr["value"]
      end
  
      @product = Product.new(product_params.except(:product_attributes))
      @product.product_attributes = transformed_attributes
  
      if @product.save
        redirect_to products_path, notice: 'Product was successfully created.'
      else
        render :new
      end
    end
  end
  
  
  private

  def product_params
    params.require(:product).permit(:name).tap do |whitelisted|
      whitelisted[:product_attributes] = params[:product][:product_attributes]
    end
  end
end