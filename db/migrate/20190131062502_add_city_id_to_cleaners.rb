class AddCityIdToCleaners < ActiveRecord::Migration[5.1]
  def change
    add_reference :cleaners, :city, foreign_key: true
    add_reference :customers, :city, foreign_key: true
  end
end
