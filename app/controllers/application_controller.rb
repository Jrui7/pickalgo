class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :terms_of_service])
  end

  private


    protected
      def after_sign_in_path_for(resource)
        request.env['omniauth.origin'] || stored_location_for(resource) || root_path
      end
end
