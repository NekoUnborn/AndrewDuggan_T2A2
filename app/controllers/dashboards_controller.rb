class DashboardsController < ApplicationController
  def index
    redirect_to new_profile_path unless current_user.profile.id?
  end

  private

  def dashboard_params
    params.require(:user).permit(:username, :email, :profile_id, roles_id: [])
  end

  def check_auth
    authorize Dashboard
  end
end
