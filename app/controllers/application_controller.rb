class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

    @assignments = Assignment.order(deadline: :desc)

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])

  end
  	WillPaginate.per_page = 10
   def authorize_admin
    redirect_to :back, :status => 401 unless current_user.admin
    #redirects to previous page
    rescue ActionController::RedirectBackError
    redirect_to root_path, alert: "Nice try! Don't try hacking me :)"
end

     
end

