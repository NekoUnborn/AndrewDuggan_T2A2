class ProfilesController < ApplicationController
  # DELETE THIS BEFORE RELEASE
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]

  before_action :set_profile, only: %i[update edit]
  before_action :set_extras, only: %i[update edit]
  before_action :check_auth

  # def index
  #   @profiles = Profile.all
  # end

  def new
    @profile = Profile.new
    @profile.build_address
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile
    else
      flash.now[:errors] = @profile.errors.full_messages
      render action: 'new'
    end
  end

  # def show; end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      flash.now[:errors] = @profile.errors.full_messages
      render action: 'edit'
    end
  end

  # def destroy
  #   @profile.destroy
  #   redirect_to profiles_path
  # end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:business,
                                    address_attributes: %i[unit house_number street suburb postcode state_id],
                                    jobs_id: [],
                                    trades_id: [])
  end

  def set_trades
    @trades = Trade.order(:id)
  end

  def set_extras
    @jobs = Jobs.all
    @addresses = Address.all
    @states = State.all
  end

  def check_auth
    authorize Profile
  end
end
