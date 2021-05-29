class TradesController < ApplicationController
  # DELETE THIS BEFORE RELEASE
  # skip_before_action :verify_authenticity_token, only: %i[create update destroy]

  before_action :set_trade, only: %i[show update destroy edit]
  before_action :check_auth

  def index
    @trades = Trade.all
  end

  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)
    if @trade.save
      redirect_to trades_path
    else
      flash.now[:errors] = @trade.errors.full_messages
      render action: 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @trade.update(trade_params)
      redirect_to @trade
    else
      flash.now[:errors] = @trade.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @trade.destroy
    redirect_to trades_path
  end

  private

  def set_trade
    @trade = Trade.find(params[:id])
  end

  def trade_params
    params.require(:trade).permit(:name)
  end
  def check_auth
    authorize Trade
end
end
