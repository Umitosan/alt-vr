class ReviewsController < ApplicationController

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
      flash[:notice] = "review added!"
      redirect_to realm_path(@realm)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end

end
