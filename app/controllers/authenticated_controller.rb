class AuthenticatedController < ApplicationController
  before_action :logged_in_using_omniauth?

  private

  def logged_in_using_omniauth?
    redirect_to login_path unless session[:userinfo].present?
  end
end
