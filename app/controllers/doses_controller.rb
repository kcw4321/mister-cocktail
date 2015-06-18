class DosesController < ApplicationController
before_action :find_cocktail, only: [:new, :create]

  def new
    @dose =  Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
  end

  private
  def find_cocktail
    @cocktail = Cocktail.find(:id)
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
