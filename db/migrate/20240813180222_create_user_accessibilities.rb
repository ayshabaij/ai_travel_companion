class CreateUserAccessibilities < ActiveRecord::Migration[6.1]
  def change
    create_table :user_accessibilities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :accessibility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
