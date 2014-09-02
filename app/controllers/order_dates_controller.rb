class OrderDatesController < ApplicationController
  before_action :set_order_date, only: [:show, :edit, :update, :destroy]

  # GET /order_dates/1/edit
  def edit
  end

  # PATCH/PUT /order_dates/1
  def update
    if @order_date.update(order_date_params)
      redirect_to new_price_path
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_date
      @order_date = OrderDate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_date_params
      params.require(:order_date).permit(:date, :info)
    end
end
