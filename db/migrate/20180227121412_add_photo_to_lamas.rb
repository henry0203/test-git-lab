class AddPhotoToLamas < ActiveRecord::Migration[5.1]
  def change
    add_column :lamas, :photo, :string
  end
end
