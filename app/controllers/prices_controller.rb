class PricesController < ApplicationController
  before_action :set_price, only: [:show, :edit, :update, :destroy]

  # GET /prices
  def index
    @prices = Price.all
    @format = Format.all
    @printing_type = PrintingType.all
    @edition = Edition.all
    @edition_option = EditionOption.all
  end

  # GET /prices/1
  def show
    redirect_to new_price_path
  end

  # GET /prices/new
  def new
    @order_dates = OrderDate.all#информация о дате приема заказа
    if admin_signed_in?
      @prices = Price.all.order(:type_photo)
      @price = Price.new

    else
      redirect_to prices_path
    end
  end

  # GET /prices/1/edit
  def edit
  end

  # POST /prices
  def create
    @price = Price.new(price_params)

    if @price.save
      redirect_to @price, notice: 'Price was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /prices/1
  def update
    if @price.update(price_params)
      redirect_to @price, notice: 'Price was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /prices/1
  def destroy
    @price.destroy
    redirect_to prices_url, notice: 'Price was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    

    # Only allow a trusted parameter "white list" through.
    def price_params
      params.require(:price).permit(:type_photo, :type_paper, :format, :min_num_pages, :max_num_pages, :step_pages, :price1_4, :difference1_4, :price5_99, :difference5_99)
    end
end
