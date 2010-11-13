class AuthenticationsController < ApplicationController
  def new
  end

  def create
    render :text => request.env["omniauth.auth"].to_yaml
  end

  def destroy
  end

end
