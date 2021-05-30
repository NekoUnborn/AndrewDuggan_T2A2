class ProfilesController < ApplicationController
  # DELETE THIS BEFORE RELEASE
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]

  before_action :set_current_user_profile, only: :select_role
  before_action :set_profile, only: %i[update edit]
  before_action :set_extras, only: %i[new create update edit]
  before_action :check_auth, only: %i[edit update]

  def select_role
    @user = current_user
    # Finds all of the roles that are not :admin
    @roles = Role.where.not(name: 'admin')
  end

  def assign_role
    user = User.find(current_user.id)
    role = Role.find(params[:role_id])
    user.add_role(role.name.to_sym)
    redirect_to new_profile_path
  end

  def new
    @profile = Profile.new
    @profile.build_address
    # Finds all of the Trades in :id order
    @trades = Trade.order(:id)
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to root_path
    else
      flash.now[:errors] = @profile.errors.full_messages
      render action: 'new'
    end
  end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to root_path
    else
      flash.now[:errors] = @profile.errors.full_messages
      render action: 'edit'
    end
  end

  private

  def set_profile
    # Finds the profile referenced
    @profile = Profile.find(params[:id])
  end

  def set_current_user_profile
    # Sets the profile as either the current user profile if it exists
    @profile = current_user.profile || Profile
  end

  def profile_params
    params.require(:profile).permit(:business, :picture,
                                    address_attributes: %i[unit house_number street suburb postcode state_id],
                                    job_ids: [],
                                    trade_ids: [])
  end

  def role_params
    params.require(:profile).permit(:role_id, :user_id)
  end

  def set_extras
    @trades = Trade.order(:id)
    @states = State.order(:id)
  end

  def check_auth
    authorize @profile
  end
end
