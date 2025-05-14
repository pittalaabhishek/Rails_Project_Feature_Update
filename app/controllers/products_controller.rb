class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product_specs = [{ key: "", value: "" }]
  end

  def index
    @products = Product.all
  end

  
  def create
    @product = Product.new(product_params)
    
    if params[:add_more_attributes]
      @product_specs = []
      if params[:product_specs].present?
        params[:product_specs].each do |index, spec|
          @product_specs << { key: spec[:key], value: spec[:value] }
        end
      end
      @product_specs << { key: "", value: "" }
      render :new
    elsif @product.save
      if params[:product_specs].present?
        params[:product_specs].each do |index, spec|
          next if spec[:key].blank? && spec[:value].blank?
          @product.product_specs.create(key: spec[:key], value: spec[:value])
        end
      end
      redirect_to products_path
    else
      @product_specs = []
      if params[:product_specs].present?
        params[:product_specs].each do |index, spec|
          @product_specs << { key: spec[:key], value: spec[:value] }
        end
      end
      @product_specs = [{ key: "", value: "" }] if @product_specs.empty?
      render :new
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:name)
  end
end