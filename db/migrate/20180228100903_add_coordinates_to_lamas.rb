class AddCoordinatesToLamas < ActiveRecord::Migration[5.1]
  def change
    add_column :lamas, :latitude, :float
    add_column :lamas, :longitude, :float
  end
end
