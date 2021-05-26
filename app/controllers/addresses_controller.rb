class AddressesController < ApplicationController
  # DELETE THIS BEFORE RELEASE
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]

  before_action :set_address, only: %i[show update destroy edit]
  before_action :set_state, only: %i[show update destroy edit]
  before_action :check_auth

  def index
    @addresses = Address.all # retrieves all of the addresses db
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to @address
    else
      flash.now[:errors] = @address.errors.full_messages
      render action: 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @address.update(address_params)
      redirect_to @address
    else
      flash.now[:errors] = @address.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_path
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:unit, :house_number, :street, :suburb, :postcode, :state_id)
  end

  def set_states
    @states = State.order(:id)
  end
  
  def check_auth
    authorize Address
end
end
