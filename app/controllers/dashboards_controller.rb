class DashboardsController < ApplicationController
  def index
    redirect_to select_role_path(current_user) if current_user.profile.nil?
  end

  private

  def dashboard_params
    params.require(:user).permit(:username, :email, :profile_id, roles_id: [])
  end

  def check_auth
    authorize Dashboard
  end
end
