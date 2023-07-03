module Api
  module V1
    class ApplicationController < ActionController::Base
      skip_before_action :verify_authenticity_token, raise: false
      respond_to :json
      before_action :authenticate_devise_api_token!

      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:city_id])
      end
    end
  end
end