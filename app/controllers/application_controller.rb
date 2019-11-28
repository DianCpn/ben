class ApplicationController < ActionController::Base
  CARTON = ["carton"]
  GLASS  = ["verre", "glass", "bocal"]
  METAL = ["aluminum", "metal", "conserve", "métal"]
  PLASTIC = ["plastique", "plastic", "sachet"]

  before_action :authenticate_user!
end
