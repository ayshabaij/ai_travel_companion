class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.references :hobby, null: false, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
