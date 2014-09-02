class AddMaxNumPagesToPrice < ActiveRecord::Migration
  def change
    add_column :prices, :max_num_pages, :integer
  end
end
