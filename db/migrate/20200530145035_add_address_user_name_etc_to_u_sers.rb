class AddAddressUserNameEtcToUSers < ActiveRecord::Migration[6.0]
  def change

    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :city_name, :string
    add_column :users, :city_postcode, :integer
    add_column :users, :phone_number, :integer
  end
end
