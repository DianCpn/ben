class ContainersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:search]
      @containers = Container.where("lower(material) LIKE lower(?)", "%#{params[:search]}%")
    else
      @containers = Container.all
    end
    @markers = @containers.map do |container|
      {
        lat: container.latitude,
        lng: container.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { container: container }),
        image_url: helpers.asset_url('poubelle_tri3_verre.svg')
      }
    end
  end

  def create
  end

  def find
  end
end
