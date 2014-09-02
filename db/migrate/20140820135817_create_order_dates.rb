class CreateOrderDates < ActiveRecord::Migration
  def change
    create_table :order_dates do |t|
      t.text :date
      t.text :info

      t.timestamps
    end
  end
end
