class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :date_begin
      t.string :date_end
      t.references :user, foreign_key: true
      t.references :lama, foreign_key: true

      t.timestamps
    end
  end
end
