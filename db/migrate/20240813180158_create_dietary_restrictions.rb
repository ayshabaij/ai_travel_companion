class CreateDietaryRestrictions < ActiveRecord::Migration[6.1]
  def change
    create_table :dietary_restrictions do |t|
      t.string :name

      t.timestamps
    end
  end
end
