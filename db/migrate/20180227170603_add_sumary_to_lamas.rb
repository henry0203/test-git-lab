class AddSumaryToLamas < ActiveRecord::Migration[5.1]
  def change
    add_column :lamas, :sumary, :text
  end
end
