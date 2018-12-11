class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @lama = Lama.find(params[:lama_id])
    @booking.lama = @lama
    authorize @booking
    if @booking.save
      redirect_to lama_booking_path(@lama.id, @booking.id)
    else
      redirect_to lama_path(@lama.id)
    end
  end

  def show
    @lama = Lama.find(params[:lama_id])
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.state = params[:state]
    authorize @booking
    @booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.permit(:date_begin, :date_end, :user_id, :lama_id, :amount)
  end
end
