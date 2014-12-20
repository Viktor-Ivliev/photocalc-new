class ResultController < ApplicationController
  
  def index

  end

	def calc
    #calc[:photo]

		#render :index
	end


  def select_an_item_1
    @price_format = Price.where("type_photo = '#{params[:type_photo]}'").select(:format).order(:format).reverse_order.distinct
    respond_to do |format|
      format.json{ render json:  @price_format}
    end
  end



  def select_an_item_2
    @price_type_paper = Price.where("type_photo = '#{params[:type_photo]}'").where("format = '#{params[:form]}'").select(:type_paper).order(:type_paper).reverse_order.distinct
    respond_to do |format|
      format.html
      format.json{ render json: @price_type_paper}
    end
  end

  def select_an_item_price
    @price_select= Price.where("type_photo = '#{params[:type_photo]}'").where("format = '#{params[:form]}'").where("type_paper = '#{params[:type_paper]}'").select(:max_num_pages, :step_pages,:min_num_pages, :price1_4, :difference1_4, :price5_99, :difference5_99)
    respond_to do |format|
      format.html
      format.json{ render json: @price = { price: @price_select }}
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json{ render json:  @pric = Price.all}
       
        @pric = Price.select(:format, :type_photo).order(:format).reverse_order
    end
  end


  def res
    redirect_to result_index_path
  end



  



end
