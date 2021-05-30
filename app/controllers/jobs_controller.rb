class JobsController < ApplicationController
  # DELETE THIS BEFORE RELEASE
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]

  before_action :set_job, only: %i[show update destroy edit]
  before_action :set_trades, only: %i[new update edit]
  before_action :check_auth

  def index
    # Finds all of the Jobs
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.profile_id = current_user.profile.id
    if @job.save
      redirect_to root_path
    else
      flash.now[:errors] = @job.errors.full_messages
      render action: 'new'
    end
  end

  def show
    set_tradies
  end

  def edit; end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      flash.now[:errors] = @job.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private

  def set_job
    # Finds the referenced Job
    @job = Job.find(params[:id])
  end

  def set_tradies
    # Finds the Users that have the profile that have the same trades as the jobs
    @tradies = User.where(profile: Profile.joins(:trades).where(trades: @job.trades).uniq)
  end

  def job_params
    params.require(:job).permit(:title, :description, :date_start,
                                :date_finish, :photo, :completed,
                                trade_ids: [])
  end

  def set_trades
    # Finds all of the thrades and orders them in :id order
    @trades = Trade.order(:id)
  end

  def check_auth
    authorize Job
  end
end
