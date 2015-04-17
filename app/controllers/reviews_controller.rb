class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]

  def create
    @review = current_user.reviews.build(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to place_path(@review.place), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html {redirect_to place_path(@review.place) }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to place_path(@review.place), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to place_path(@review.place), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:content, :place_id)
    end

end
