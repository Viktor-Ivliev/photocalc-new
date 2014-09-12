class Edition < ActiveRecord::Base
	belongs_to :format
  has_many :edition_options

  def to_data
    { caption: caption, 
      data: pages_array,
      edition_option: edition_options.map(&:to_data)
      }
  end

 private

  def pages_array
    (min_pages..max_pages).step(step).to_a
  end

  def caption
    "Price from #{min_edition} to #{max_edition}"
  end
end

# == Schema Information
#
# Table name: editions
#
#  id          :integer          not null, primary key
#  min_pages   :integer
#  max_pages   :integer
#  step        :integer
#  min_edition :integer
#  max_edition :integer
#  format_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

