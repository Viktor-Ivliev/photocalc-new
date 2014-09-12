class EditionOption < ActiveRecord::Base
	belongs_to :editions

	def to_data
		{ 
    	paper_option: paper_option,
    	price: price,
    	difference: difference
    	}
  	end

	# def change
	#     create_table :edition_options do |t|
	#       t.string :paper_option
	#       t.decimal :price
	#       t.decimal :difference
	#       t.integer :edition_id

	#       t.timestamps
	#     end
	#  end
end
