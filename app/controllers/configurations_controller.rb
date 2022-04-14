class ConfigurationsController < AuthenticatedController
  def show
    @user = current_user
  end

  def update
    timezone = ActiveSupport::TimeZone[timezone_param]
    if timezone
      current_user.update(timezone: timezone.name)
    end

    render :index
  end

  private

  def timezone_param
    params.require(:user).permit(:timezone)[:timezone]
  end
end
