class AddCityToCleaners < ActiveRecord::Migration[5.1]
  def change
    add_column :cleaners, :city, :string
  end
end
