class IpaddressesController < ApplicationController
  before_action :set_ipaddress, only: [:show, :update, :destroy]

  # GET /ipaddresses
  def index
    @ipaddresses = Ipaddress.all
    render json: @ipaddresses
  end

  # GET /ipaddresses/1
  def show
    render json: @ipaddress
  end

  # POST /ipaddresses
  def create
    @ipaddress = Ipaddress.new(ipaddress_params)

    if @ipaddress.save
      render json: @ipaddress, status: :created, location: @ipaddress
    else
      render json: @ipaddress.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ipaddresses/1
  def update
    if @ipaddress.update(ipaddress_params)
      render json: @ipaddress
    else
      render json: @ipaddress.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ipaddresses/1
  def destroy
    @ipaddress.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ipaddress
      @ipaddress = Ipaddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ipaddress_params
      params.require(:ipaddress).permit(:address, :acquired?, :cidrblock_id)
    end
end
