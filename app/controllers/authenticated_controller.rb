class AuthenticatedController < ApplicationController
  before_action :logged_in_using_omniauth?
  around_action :set_time_zone

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

  def set_time_zone
    Time.use_zone(current_user.timezone || "UTC") { yield }
  end
end
