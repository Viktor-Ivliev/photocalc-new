class Format < ActiveRecord::Base
	has_many :editions
	belongs_to :printing_type

  def to_data
    {
      title: title,
      photo: photo,
      editions: editions.map(&:to_data),
      #edition_options: edition_options.map(&:to_data)
    }
  end
end

# == Schema Information
#
# Table name: formats
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  photo            :string(255)
#  printing_type_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

