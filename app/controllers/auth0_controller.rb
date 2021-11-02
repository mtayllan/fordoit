class Auth0Controller < ApplicationController
  def callback
    auth_info = request.env["omniauth.auth"]
    session[:userinfo] = auth_info["extra"]["raw_info"]

    auth0_id = session[:userinfo]["sub"].split("|")[1]
    User.find_or_create_by(auth0_id: auth0_id)

    redirect_to "/"
  end

  def failure
    @error_msg = request.params["message"]
  end

  def logout
    reset_session
    redirect_to logout_url
  end

  private

  def logout_url
    request_params = ActionController::Parameters.new({
      returnTo: root_url,
      client_id: ENV["AUTH0_CLIENT_ID"]
    }).permit(:returnTo, :client_id)

    URI::HTTPS.build(host: ENV["AUTH0_DOMAIN"], path: "/v2/logout", query: request_params.to_query).to_s
  end
end
