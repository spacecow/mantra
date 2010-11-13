class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    else
#      current_user.authentications.
 #       redirect_to authentications_url, :notice => "Authentication successful."
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
  end

end
