require 'json'
require_relative "../models/container.rb"

class ContainermapService
  def call
    filepath = './db/containers.json'
    #filepath = File.join(Rails.root, 'db', 'containers.json')

    serialized_containers = File.read(filepath)

    containers = JSON.parse(serialized_containers)


    containers["features"].each do |container|
      Container.new(address: "#{container["attributes"]["Match_addr"]}", sector: "#{container["attributes"]["secteur"]}", latitude: "#{container["geometry"]["y"]}", longitude:"#{container["geometry"]["x"]}", material: "verre")
    end
  end
end

puts ContainermapService.new.call
