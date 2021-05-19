class ApplicationController < ActionController::Base
  include Pundit
rescue_from Pundit:NotAuthorisedError, with: :forbidden
private
  def forbidden
    flash[:alert] = 'you are not authorised to perform that action'
    redirect_to request.referrer || root_path
  end

end
