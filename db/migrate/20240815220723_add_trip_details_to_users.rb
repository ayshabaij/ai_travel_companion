class AddTripDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :trip_start_date, :date
    add_column :users, :trip_end_date, :date
    add_column :users, :trip_address, :string
    add_column :users, :trip_budget, :integer
  end
end
