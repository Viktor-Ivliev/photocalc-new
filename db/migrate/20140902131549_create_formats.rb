class CreateFormats < ActiveRecord::Migration
  def change
    create_table :formats do |t|
      t.string :title
      t.string :photo
      t.integer :printing_type_id

      t.timestamps
    end
  end
end
