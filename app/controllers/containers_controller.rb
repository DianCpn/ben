class ContainersController < ApplicationController
  def index
    @containers = Container.all #returns flats with coordinates
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
