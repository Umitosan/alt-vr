class ReviewsController < ApplicationController
  before_action :authorize_user, only: [:new, :create, :destroy]

  def new
    @realm = Realm.find(params[:realm_id])
    @review = @realm.reviews.new
  end

  def create
    @user = current_user
    @realm = Realm.find(params[:realm_id])
    @review = @realm.reviews.new(review_params)
    @review.user_id = @user.id
    if @review.save
      flash[:notice] = "( review added )"
      redirect_to realm_path(@realm)
    else
      render :new
    end
  end

  def destroy
    @realm = Realm.find(params[:realm_id])
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "( Reveiw deleted )"
    redirect_to realm_path(@realm)
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end

end
