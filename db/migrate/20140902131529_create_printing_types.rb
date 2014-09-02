class CreatePrintingTypes < ActiveRecord::Migration
  def change
    create_table :printing_types do |t|
      t.string :title
      t.string :photo

      t.timestamps
    end
  end
end
