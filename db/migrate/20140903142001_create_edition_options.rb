class CreateEditionOptions < ActiveRecord::Migration
  def change
    create_table :edition_options do |t|
      t.string :paper_option
      t.decimal :price
      t.decimal :difference
      t.integer :edition_id

      t.timestamps
    end
  end
end
