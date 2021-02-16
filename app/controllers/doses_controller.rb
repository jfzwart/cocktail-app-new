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
      @dose = Dose.find(params[:id])
    end
  
    def update
      @dose = Dose.find(params[:id])
      if @dose.update(dose_params)
        redirect_to dose_path(@dose), notice: 'Dose was updated'
      else
        render :edit
      end
    end
  
    def destroy
      @dose = Dose.find(params[:id])
      @dose.destroy
      redirect_to cocktail_path(@dose.cocktail)
    end
  
    private

    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
  
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
  end