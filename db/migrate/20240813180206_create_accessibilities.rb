class CreateAccessibilities < ActiveRecord::Migration[6.1]
  def change
    create_table :accessibilities do |t|
      t.string :name

      t.timestamps
    end
  end
end
