# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = %i[name email address postcode introduction]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
