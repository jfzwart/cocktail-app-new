class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new]

    def index
      @doses = Dose.all
    end

    def new
      @dose = Dose.new
    end

    def create
      @cocktail = Cocktail.find(params[:cocktail_id])
      @dose = Dose.new(dose_params)
      @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
    end

    def edit
      @cocktail = Cocktail.find(params[:cocktail_id])
      @dose = Dose.find(params[:id])
    end
  
    def update
      @dose = Dose.find(params[:id])
      @cocktail = Cocktail.find(params[:cocktail_id])
      if @dose.update(dose_params)
        redirect_to cocktail_path(@cocktail), notice: 'Dose was updated'
      else
        render :edit
      end
    end
  
    def destroy
      @dose = Dose.find(params[:id])
      @cocktail = @dose.cocktail
      @dose.destroy
      redirect_to cocktail_path(@cocktail)
    end
  
    private

    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
  
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
  end