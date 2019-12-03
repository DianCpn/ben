class ContainersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @containers = Container.where(material: "verre")
    @markers = @containers.map do |container|
      {
        lat: container.latitude,
        lng: container.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { container: container }),
        image_url: helpers.asset_url('green-point.svg')
      }
    end
  end

  def create
  end

  def result
    @containers = Container.where("lower(material) LIKE lower(?)", "pile")
    @markers = @containers.map do |container|
      {
        lat: container.latitude,
        lng: container.longitude,
        infoWindow: render_to_string(partial: "info_window_pile", locals: { container: container }),
        image_url: helpers.asset_url('blue-point.svg')
      }
    end
  end

  def tip
  end
end
