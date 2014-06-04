class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    gon.environment = Rails.env
  end

end
