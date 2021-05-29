class DashboardsController < ApplicationController
  def index
    if !current_user.has_any_role?
      redirect_to select_role_path
    elsif !current_user.profile
      redirect_to new_profile_path
    end

    if current_user.has_role? :user
      @jobs = current_user.profile.jobs.all
    elsif current_user.has_role? :tradie
      @jobs = Job.joins(:trades).where(trades: current_user.profile.trades).uniq
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
