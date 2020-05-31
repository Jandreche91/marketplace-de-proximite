class ChangeColumnOfPhoneNumberInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :phone_number, :string
    change_column :users, :city_postcode, :string
  end
end
