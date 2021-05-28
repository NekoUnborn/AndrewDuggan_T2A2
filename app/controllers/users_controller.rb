class UsersController < ApplicationController
  # DELETE THIS BEFORE RELEASE
  # skip_before_action :verify_authenticity_token, only: %i[create update destroy]
  before_action :check_auth

  def index
    check_auth
    @users = User.all
  end

  def show
    check_auth
    @user = User.find(params[:id])
  end

  def destroy
    check_auth
    @user.destroy
    redirect_to users_path
  end

  def self.has_any_roles?
    User.has_role?(:user, :tradies, :admin)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :profile_id, roles_id: [])
  end

  def check_auth
    authorize User
  end
end
