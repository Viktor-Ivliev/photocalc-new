class PrintingType < ActiveRecord::Base
	has_many :formats
end

# == Schema Information
#
# Table name: printing_types
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  photo      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

