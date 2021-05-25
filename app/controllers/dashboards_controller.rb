class DashboardsController < ApplicationController
  # DELETE THIS BEFORE RELEASE
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]
  before_action :set_dashboard, only: %i[show update destroy edit]

  def index
    @dashboards = Dashboard.all
  end

  def new
    @dashboard = Dashboard.new
  end

  def create
    @dashboard = Dashboard.new(dashboard_params)
    if @dashboard.save
      redirect_to @dashboard
    else
      flash.now[:errors] = @dashboard.errors.full_messages
      render action: 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @dashboard.update(dashboard_params)
      redirect_to @dashboard
    else
      flash.now[:errors] = @dashboard.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @dashboard.destroy
    redirect_to dashboards_path
  end

  private

  def set_dashboard
    @dashboard = Dashboard.find(params[:id])
  end

  def dashboard_params
    params.require(:dashboard).permit(:param1, :param2)
  end
  def check_auth
    authorize Dashboard
end
end
