class AuthenticatedController < ApplicationController
  before_action :logged_in_using_omniauth?

  private

  def logged_in_using_omniauth?
    redirect_to login_path unless session[:userinfo].present?
  end

  def current_user
    User.find_by(auth0_id: auth0_id)
  end

  def auth0_id
    session[:userinfo]["sub"].split("|")[1]
  end
end
