class ReviewsController < ApplicationController
    before_action :set_cocktail, only: [:new]
      def index
    @reviews = Review.all
    end

    def new
      @review = Review.new
    end
    
    def create
      @cocktail = Cocktail.find(params[:cocktail_id])
      @review = Review.new(review_params)
      @review.cocktail = @cocktail
      if @review.save
        redirect_to cocktail_path(@cocktail)
      else
        @review = Review.new
        render "cocktails/show"
      end
    end

    private
    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
  
    def review_params
      params.require(:review).permit(:rating, :content)
    end
  end