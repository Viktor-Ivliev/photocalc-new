class ResultController < ApplicationController
  
  def index

  end

	def calc

		calc = params[:calc]

    @result = Price.where(type_photo: calc[:photo]).where(type_paper: calc[:paper]).where(format: calc[:format])
    
    #реализация расчета цены

    @num_pages = calc[:number_of_turns].to_i#кол - разваротов
    @number_copies = calc[:number].to_i#тираж
    @result.each do |result|

      if @number_copies < 5
          if  @num_pages == result.min_num_pages
            @Price_calc = result.price1_4
          else
             @Price_calc = result.price1_4 + result.difference1_4 * (@num_pages - result.min_num_pages)
          end
      else
          if  @num_pages == result.min_num_pages
            @Price_calc = result.price5_99
          else
             @Price_calc = result.price5_99 + result.difference5_99 * (@num_pages - result.min_num_pages)
          end
      end
      @Price_all = 0
      @Price_all = @Price_calc * @number_copies
    end

		render :index
	end

  def show
  end

  def res
    redirect_to result_index_path
  end

end
