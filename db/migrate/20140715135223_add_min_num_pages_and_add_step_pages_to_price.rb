class AddMinNumPagesAndAddStepPagesToPrice < ActiveRecord::Migration
  def change
    add_column :prices, :min_num_pages, :integer
    add_column :prices, :step_pages, :integer
  end
end
