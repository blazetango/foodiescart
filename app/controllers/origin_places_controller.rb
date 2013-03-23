class OriginPlacesController < ApplicationController

def index
  @origin = OriginPlace.order(:country).where("country like ?", "%#{params[:term]}%")
  render json: @origin.map(&:country)
  end


end
