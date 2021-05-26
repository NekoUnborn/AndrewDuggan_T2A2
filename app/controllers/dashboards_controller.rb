class DashboardsController < ApplicationController
  # DELETE THIS BEFORE RELEASE
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]
  # before_action :set_user, only: %i[show update destroy edit]

  def index
    @User = current_user
  end

  private

  def dashboard_params
    params.require(:dashboard).permit(:param1, :param2)
  end
  def check_auth
    authorize Dashboard
end
end
