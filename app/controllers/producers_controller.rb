class ProducersController < ApplicationController
  before_action :set_producer, only: [:show, :edit, :update, :destroy]

 def show
    @producer = Producer.find(params[:id])
 end




private
    # Use callbacks to share common setup or constraints between actions.
    def set_producer
      @producer = Producer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producer_params
      params.require(:producer).permit(:name, :email, :password_digest, :image, :phone, :type)
    end


end
