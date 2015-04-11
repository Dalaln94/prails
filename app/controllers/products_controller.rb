class ProductsController < ApplicationController
 

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    if params[:search_manufacturer].present? || params[:search_category].present?
      @items = Item.search(params[:search_manufacturer], params[:search_category] ).order("created_at DESC")

    else
      @items = Item.order("created_at DESC")
    end
  end

  def search
  if params[:query]
    @items = Item.search(params[:query])
  else
    @items = []
  end
end



  # GET /phone_numbers/1
  # GET /phone_numbers/1.json
  def show
    
  end

  # GET /phone_numbers/new
  def new
    @product = Product.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food }
    end
  end
  

  # GET /phone_numbers/1/edit
  def edit
  end
  

  # POST /phone_numbers
  # POST /phone_numbers.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phone_numbers/1
  # PATCH/PUT /phone_numbers/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_numbers/1
  # DELETE /phone_numbers/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :number, :price, :active, :user_id, :category, :manufacturer, :picture)
    end

  end