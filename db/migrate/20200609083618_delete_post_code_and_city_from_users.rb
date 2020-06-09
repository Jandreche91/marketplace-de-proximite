class DeletePostCodeAndCityFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :city_name
    remove_column :users, :city_postcode
  end
end
