class ResultController < ApplicationController
  
  def index

  end

	def calc

		# calc = params[:calc]

    # @result = Price.where(type_photo: calc[:photo]).where(type_paper: calc[:paper]).where(format: calc[:format])
    
    #реализация расчета цены


		render :index
	end

  def show
    respond_to do |format|
      format.html
      format.json{ render json:  @pric = Price.all}
       
        #@pric = Price.select(:format, :type_photo).order(:format).reverse_order
    end
  end

  def res
    redirect_to result_index_path
  end

end
