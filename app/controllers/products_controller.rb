class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.product_attributes ||= {}
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to index, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name).tap do |whitelisted|
      whitelisted[:product_attributes] = params[:product][:product_attributes]
    end
  end
end