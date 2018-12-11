class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @reviews = policy_scope(Review)
  end

  def create
    @user = User.find(current_user.id)
    @lama = Lama.find(params[:lama_id])
    @review = Review.new(review_params)
    @review.user = @user
    @review.lama = @lama
    authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to lama_path(@lama.id) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'lamas/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
