module RailsApiFilters
  extend ActiveSupport::Concern
  
  included do 
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
  end

  def not_found
    render json: "Resource not found (404)", status: :not_found
  end
end

ActionController::Base.send :include, RailsApiFilters

if defined? ActionController::API
  ActionController::API.send :include, RailsApiFilters
end
