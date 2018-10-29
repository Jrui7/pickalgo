class ProductsController < ApplicationController
  before_action :set_page_params, only: [:index, :new]
  skip_before_action :authenticate_user!
  before_action :authenticate_pro!

  def index
    @pro = current_pro
    @products = policy_scope(Product).my_products(@pro)
  end

  def new
    @product = Product.new
    authorize @product
    @pro = current_pro
  end

  def create
    @product = current_pro.products.build(product_params)
    authorize @product
   if @product.save
     redirect_to products_path
   else
     render :new
   end
 end

  private

  def set_page_params
    @page = params["controller"]
  end

  def product_params
    params.require(:product).permit(:title, :price, :category_id, :description, photos: [])
  end

end
