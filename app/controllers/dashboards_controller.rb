class DashboardsController < ApplicationController
  def index
    if !current_user.has_any_role?
      redirect_to select_role_path
    elsif !current_user.profile
      redirect_to new_profile_path
    end
  end

  private

  def dashboard_params
    params.require(:user).permit(:username, :email, :profile_id, roles_id: [])
  end

  def check_auth
    authorize Dashboard
  end
end
