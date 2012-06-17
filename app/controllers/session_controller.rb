class SessionController < ApplicationController
  before_filter :require_no_user, :only => [:login, :auth]
  before_filter :require_user, :only => :logout


  def login
    @user_session = UserSession.new
  end

  #def token_auth
  #  @user_session = UserSession.new(User.find_by_single_access_token(params[:token]))
  #  if @user_session.save
  #    flash[:notice] = "Login successful!"
  #    redirect_back_or_default locations_path
  #  else
  #    render :action => :login
  #  end
  #
  #end


  def logout
    current_user_session.destroy
    respond_to do |format|
      format.html {
        flash[:notice] = "Logout successful!"
        redirect_back_or_default login_path
      }
      format.json {
        reset_token(current_user)
        render json: {:status => 'Logged out'}, status: :ok
      }
    end
  end

  def auth
    @user_session = UserSession.new(params[:user_session])
    p params[:user_session]
    respond_to do |format|
      if @user_session.save
        format.html {
          flash[:notice] = "Login successful!"
          redirect_back_or_default locations_path
        }

        format.json {
          reset_token(@user_session.record)
          render json: @user_session.record.single_access_token }
      else
        format.html { render :action => :login }
        format.json { render json: @user_session.errors, status: :forbidden }
      end
    end
  end

  def reset_token(user)
    if user
      user.reset_single_access_token
      user.save
    end
  end

end
