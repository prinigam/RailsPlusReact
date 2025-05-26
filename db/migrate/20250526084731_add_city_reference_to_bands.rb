class AddCityReferenceToBands < ActiveRecord::Migration[7.1]
  def change
    add_reference :bands, :city, foreign_key: true
  end
end
