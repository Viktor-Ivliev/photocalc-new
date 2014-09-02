class Price < ActiveRecord::Base
end

# == Schema Information
#
# Table name: prices
#
#  id             :integer          not null, primary key
#  type_photo     :string(255)
#  type_paper     :string(255)
#  format         :string(255)
#  price1_4       :decimal(, )
#  difference1_4  :decimal(, )
#  price5_99      :decimal(, )
#  difference5_99 :decimal(, )
#  created_at     :datetime
#  updated_at     :datetime
#  min_num_pages  :integer
#  step_pages     :integer
#  max_num_pages  :integer
#

