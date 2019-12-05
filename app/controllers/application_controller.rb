class ApplicationController < ActionController::Base
  CARTON = ["carton", "paquet"]
  GLASS  = ["verre", "glass", "bocal"]
  METAL = ["aluminum", "metal", "conserve", "métal"]
  PLASTIC = ["plastique", "plastic", "sachet"]

  before_action :authenticate_user!

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
