class CreateUserDietaryRestrictions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_dietary_restrictions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dietary_restriction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
