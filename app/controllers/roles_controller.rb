class RolesController < ApplicationController
  # DELETE THIS BEFORE RELEASE
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]

  before_action :set_role, only: %i[show update destroy edit remove_role]
  before_action :check_auth

  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    @role.user = current_user
    if @role.save
      redirect_to roles_path
    else
      flash.now[:errors] = @role.errors.full_messages
      render action: 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @role.update(role_params)
      redirect_to @role
    else
      flash.now[:errors] = @role.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @role.destroy
    redirect_to roles_path
  end

  def remove_role_from_user
    user = User.find(params[:user_id])
    role = Role.find(params[:role_id])
    user.remove_role(role.name.to_sym)
    redirect_to role
  end

  def add_user; end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name)
  end

  def check_auth
    authorize Role
  end

  def check_auth
    authorize Role
end
end
