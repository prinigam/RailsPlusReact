class BandsController < ApplicationController
  def index
    bands = Band.all
    render json: bands
  end

  def create
    band = Band.new(band_params)
    if band.save
      render json: band, status: :ok
    else
      render json: band.errors, status: :unprocessable_entity
    end
  end



  private

  def band_params
    params.require(:band).permit(:name, :artist, :city_id)
  end
end