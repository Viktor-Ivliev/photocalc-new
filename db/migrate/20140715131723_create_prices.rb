class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :type_photo
      t.string :type_paper
      t.string :format
      t.decimal :price1_4
      t.decimal :difference1_4
      t.decimal :price5_99
      t.decimal :difference5_99

      t.timestamps
    end
  end
end
