class NilClass
  def method_missing(p)
    return nil
  end
end

class ApplicationController < ActionController::Base
  helper :all
  helper_method :current_user_session, :current_user
  #filter_parameter_logging :password, :password_confirmation
  layout "main"



  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      respond_to do |format|
        format.html {
          flash[:error] = "You must be logged in to access this page"
          redirect_to login_url
        }
        format.json { render json: {:status => 'Login required'}, status: :forbidden }
      end
      return false
    end
  end

  def require_admin
    unless (current_user && current_user.has_role?('admin'))
      respond_to do |format|
        format.html {
          flash[:error] = "You must be admin to access this page"
          redirect_to login_url
        }
        format.json { render json: {:status => 'Admin required'}, status: :forbidden }
      end
      return false
    end
  end


  def require_no_user
    if current_user
      #store_location
      respond_to do |format|
        format.html {
          flash[:notice] = "You must be logged out to access this page"
          redirect_to locations_url
        }
        format.json { render json: {:status => 'No acces when logged in'}, status: :forbidden }
      end
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
