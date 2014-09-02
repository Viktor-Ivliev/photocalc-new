class CreateEditions < ActiveRecord::Migration
  def change
    create_table :editions do |t|
      t.integer :min_pages
      t.integer :max_pages
      t.integer :step
      t.integer :min_edition
      t.integer :max_edition
      t.integer :format_id

      t.timestamps
    end
  end
end
