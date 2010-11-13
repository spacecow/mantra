class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    current_user.authentications.create(:provider => auth['provider'], :uid => auth['uid'])
    redirect_to authentications_url, :notice => "Authentication successful."
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
  end

end
