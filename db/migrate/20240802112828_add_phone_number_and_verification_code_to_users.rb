class AddPhoneNumberAndVerificationCodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :verification_code, :string
  end
end
