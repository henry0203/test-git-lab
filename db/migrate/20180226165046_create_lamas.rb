class CreateLamas < ActiveRecord::Migration[5.1]
  def change
    create_table :lamas do |t|
      t.string :name
      t.string :category
      t.string :address
      t.string :zipcode
      t.string :city
      t.text :description
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
