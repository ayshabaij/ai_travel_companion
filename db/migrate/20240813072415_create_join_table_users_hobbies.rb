class CreateJoinTableUsersHobbies < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :hobbies do |t|
      t.index [:user_id, :hobby_id]
      t.index [:hobby_id, :user_id]
    end
  end
end
