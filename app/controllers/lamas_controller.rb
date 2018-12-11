require 'pry'

class LamasController < ApplicationController
  before_action :set_lama, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :show
  skip_before_action :authenticate_user!, only: :index

  def index
    logger.debug
    @lamas = policy_scope(Lama) # .where.not(latitude: nil, longitude: nil)
    @lamas = @lamas.where('category ILIKE ?', "%#{params['category']}%").where('name ILIKE ? or sumary ILIKE ?', "%#{params['query']}%", "%#{params['query']}%").order(created_at: :desc) #.where('sumary ILIKE ?', "%#{params['query']}%")

    @markers = @lamas.map do |lama|
      {
        lat: lama.latitude,
        lng: lama.longitude#,
        # infoWindow: { content: render_to_string(partial: "/lamas/map_box", locals: { lama: lama }) }
      }
    end
  end

  def show
    @marker = {
    lat: @lama.latitude,
    lng: @lama.longitude
    }
    @review = Review.new
  end

  def new
    @lama = Lama.new
    authorize @lama
  end

  def create
    @lama = Lama.new(lama_params)
    @lama.user = current_user
    @lama.sumary = "#{@lama.name} #{@lama.description} #{@lama.price} #{@lama.address} #{@lama.zipcode}"
    authorize @lama
    if @lama.save
      redirect_to lama_path(@lama)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @lama.update(lama_params)
    redirect_to lama_path(@lama)
  end

  def destroy
    @lama.destroy
    redirect_to lamas_path
  end

  private

  def set_lama
    @lama = Lama.find(params[:id])
    authorize @lama
  end

  def lama_params
    params.require(:lama).permit(:name, :category, :address, :zipcode, :city, :description, :price, :photo, :photo_cache)
  end
end
