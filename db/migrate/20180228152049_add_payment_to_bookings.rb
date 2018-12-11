class AddPaymentToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :payment, :jsonb
  end
end
