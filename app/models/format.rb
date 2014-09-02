class Format < ActiveRecord::Base
	has_many :edition
	belongs_to :printing_type
end
