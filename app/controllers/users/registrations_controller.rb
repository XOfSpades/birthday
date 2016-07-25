class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    permitted_params =
      devise_parameter_sanitizer.instance_variable_get(:@permitted)[:sign_up]
    permitted_params << :first_name
    permitted_params << :last_name
  end
end
