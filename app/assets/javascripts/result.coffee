# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

	#//функция для расчета 
	calculate = (nil) ->
		photo = $("input[name='calc[photo]']:checked").val()
		paper = $("input[name='calc[paper]']:checked").val()
		format = $("input[name='calc[format]']:checked").val()
		num_pages = $('#calc_number_of_turns').val()
		number_copies = $('#calc_number').val()
		Price_calc = 0
		$.getJSON "/result/select_an_item_price/"+photo+"/"+format+"/"+paper+".json", (data) ->
			$.each data, (id,nu) ->
				if parseInt(number_copies) < 5
					if num_pages == parseInt(nu[0].min_num_pages)
						Price_calc = parseInt(nu[0].price1_4)
					else
						Price_calc = parseInt(nu[0].price1_4) + parseInt(nu[0].difference1_4) * (parseInt(num_pages) - parseInt(nu[0].min_num_pages))
				else
					if num_pages == parseInt(nu[0].min_num_pages)
						Price_calc = nu[0].rprice5_99
					else
						Price_calc = parseInt(nu[0].price5_99) + parseInt(nu[0].difference5_99) * (parseInt(num_pages) - parseInt(nu[0].min_num_pages))
				return
			

			Price_all = 1
			Price_all = Price_calc * number_copies
			$('#calc').html("<h4><b>Вартість:</b><br/> <div class='price'> #{Price_calc} </div> грн. за книгу <hr/><b>Загальна вартiсть: </b><div class='price_grin'> #{Price_all} </div> грн.</h4>")
			$('#calc').parent().show() 



	page_count = (nil) ->
		photo = $("input[name='calc[photo]']:checked").val()
		paper = $("input[name='calc[paper]']:checked").val()
		format = $("input[name='calc[format]']:checked").val()
		number_of_turns = ''
		$.getJSON "/result/select_an_item_price/"+photo+"/"+format+"/"+paper+".json", (data) ->
			$.each data, (id,nu) ->
				number_of_turns = '<input id="calc_number_of_turns" max="'+nu[0].max_num_pages+'" min="'+nu[0].min_num_pages+'" name="calc[number_of_turns]" step="'+nu[0].step_pages+'" type="number" value="'+nu[0].min_num_pages+'"/>'
				return
			$('#number_field_number_of_turns').html("#{number_of_turns}")
			$('#number_field_number_of_turns').parent().show()
			$('#number_field_number').parent().show()
			calculate "calculate"

	#// список 2
	list_of_2 = (nil) ->
		photo = $("input[name='calc[photo]']:checked").val()
		options = ''
		$.getJSON "result/select_an_item_1/"+photo+".json", (data) ->
			checkeds = true
			$.each data, (id, fr) ->
				if checkeds
					options += '<input type="radio" class="calc_format checkbox_none" id="my-checkbox'+fr.format+'" name="calc[format]" value="'+fr.format+'" checked/>'
					checkeds = false
				else
					options += '<input type="radio" class="calc_format checkbox_none" id="my-checkbox'+fr.format+'" name="calc[format]" value="'+fr.format+'"/>'
				options += '<label class="format_label" for="my-checkbox'+fr.format+'">'
				options += '<img class="format_img" src="/assets/book/f'+fr.format+'.jpg">'
				options += fr.format+' см.</label>'
				return

			$('#calc_format').html("#{options}")
			$('#calc_format').parent().show()

			$('#calc_paper').parent().hide()
			$('#number_field_number_of_turns').parent().hide()
			$('#number_field_number').parent().hide()
			list_of_3 "list"

	#// список 3
	list_of_3 = (nil) ->
		photo = $("input[name='calc[photo]']:checked").val()
		format = $("input[name='calc[format]']:checked").val()
		paper = ''
		options = ''
		$.getJSON "result/select_an_item_2/"+photo+"/"+format+".json", (data) ->
			checkeds = true
			$.each data, (id, pr) ->
				if checkeds
					options += '<input type="radio" class="calc_paper checkbox_none" id="my-checkbox'+pr.type_paper+'" name="calc[paper]" value="'+pr.type_paper+'" checked/>'
					checkeds = false
				else
					options += '<input type="radio" class="calc_paper checkbox_none" id="my-checkbox'+pr.type_paper+'" name="calc[paper]" value="'+pr.type_paper+'"/>'					
				options += '<label class="paper_label" for="my-checkbox'+pr.type_paper+'">'+pr.type_paper+'</label>'
				return
			$('#calc_paper').html("#{options}")
			$('#calc_paper').parent().show()

			$('#number_field_number_of_turns').parent().hide()
			$('#number_field_number').parent().hide()
			page_count "count"


	#// список 2
	$('#calc_format').parent().hide()
	$('#calc_photo').change ->
		list_of_2 "list"  

	#// список 3
	$('#calc_paper').parent().hide()
	$('#calc_format').change ->
		list_of_3 "list"
		page_count "count"


	#//количество прайсов и страниц
	$('#number_field_number_of_turns').parent().hide()
	$('#number_field_number').parent().hide()
	$('#calc_paper').change ->
		page_count "count"
		
	#//реакция на изменение значения количестве страниц и прайсе
	$('#number_field_number_of_turns').click ->	
		calculate "calculate"

	$('#calc_number').change ->
		calculate "calculate"




	#//обработка клика "расчитать"
	$('#calc').parent().hide()
	$('#calculate_cost').click ->
		calculate "calculate"

	#//выбор первого расчитаного товара
	
	$(document).on 'ready page:load', ->
		list_of_2 "list"  
	
 

	

