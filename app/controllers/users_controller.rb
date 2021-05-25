class UsersController < ApplicationController
  # DELETE THIS BEFORE RELEASE
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]
  before_action :set_user, only: %i[show update destroy edit]
  before_action :set_trades, only: %i[show update destroy edit]
  before_action :set_role, only: %i[show update destroy edit]
  before_action :check_auth

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render action: 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_trades
    @trades = Trade.order(:id)
  end

  def set_roles
    @roles = Role.order(:name)
  end

  def user_params
    params.require(:user).permit(:username, :email, :profile_id, roles_id: [])
  end

  def check_auth
    authorize User
end
end
