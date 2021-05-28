class JobsController < ApplicationController
  # DELETE THIS BEFORE RELEASE
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]
  before_action :set_job, only: %i[show update destroy edit]
  before_action :set_trades, only: %i[new create update edit]
  before_action :check_auth

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      flash.now[:errors] = @job.errors.full_messages
      render action: 'new'
    end
  end

  def show; end

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
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :date_start, :date_finish, :photo, :complete)
  end

  def set_trades
    @trades = Trade.order(:id)
  end

  def check_auth
    authorize Job
end
end
