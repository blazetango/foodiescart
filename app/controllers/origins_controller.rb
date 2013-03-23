class OriginsController < ApplicationController


 def index
    @origin = Origin.order(:country).where("country like ?", "%#{params[:term]}%")

    render json: @origin.map(&:country)
  end
end


