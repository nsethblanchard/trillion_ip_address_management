class CidrblocksController < ApplicationController
  before_action :set_cidrblock, only: [:show, :update, :destroy]

  # GET /cidrblocks
  def index
    @cidrblocks = Cidrblock.all

    render json: @cidrblocks
  end

  # GET /cidrblocks/1
  def show
    render json: @cidrblock
  end
  
  def new
    @cidrblock = Cidrblock.new(cidrblock_params)
  end
  
  # POST /cidrblocks
  def create
    @cidrblock = Cidrblock.new(cidrblock_params)
    
    if @cidrblock.save
      block = IPAddress::IPv4.new @cidrblock.name
      block.each_host do |host|
          Ipaddress.create(address:host, block_id:@cidrblock.id)
      end
      
      render json: @cidrblock, status: :created, location: @cidrblock
    else
      render json: @cidrblock.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cidrblocks/1
  def update
    if @cidrblock.update(cidrblock_params)
      render json: @cidrblock
    else
      render json: @cidrblock.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cidrblocks/1
  def destroy
    @cidrblock.destroy
  end

  private
    
    def set_cidrblock
      @cidrblock = Cidrblock.find(params[:id])
    end

    
    def cidrblock_params
      params.fetch(:cidrblock, {})
    end
end
