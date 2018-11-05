class ProductsController < ApplicationController
  before_action :set_page_params, only: [:index, :new, :edit]
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

  def edit
    @product = Product.find(params[:id])
    authorize @product
    @pro = current_pro
  end

  def create
    @pro = current_pro
    @product = @pro.products.build(product_params)
    authorize @product
   if @product.save
     redirect_to new_product_campaign_path(@product)
   else
     render :new
   end
 end

 def update
   @product = Product.find(params[:id])
   @pro = current_pro
   authorize @product
   if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
   end
 end

  private

  def set_page_params
    @page = params["controller"]
  end

  def product_params
    params.require(:product).permit(:title, :price, :price_ht, :expedition_costs, :category_id, :website, :size_guide, :video_url, :description, photos: [])
  end

end
