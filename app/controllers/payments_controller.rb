class PaymentsController < ApplicationController
  before_action :set_order

  def new
    authorize @booking
  end

  def create
    authorize @booking
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @booking.amount,
      description:  "Payment for teddy #{@booking.lama_id} for order #{@booking.id}",
      currency:     "eur"
    )

    @booking.update(payment: charge.to_json)
    redirect_to lama_booking_path(@booking.lama.id, @booking.id)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_booking_payment_path(@booking)
  end

private

  def set_order
    @booking = Booking.find(params[:booking_id])
  end
end
