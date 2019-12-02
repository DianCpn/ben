require 'json'

filepath = './db/containers.json'

serialized_containers = File.read(filepath)

containers = JSON.parse(serialized_containers)

containers["features"].each do |container|
  Container.create(address: "#{container["attributes"]["Match_addr"]}", sector: "#{container["attributes"]["secteur"]}", latitude: "#{container["geometry"]["y"]}", longitude:"#{container["geometry"]["x"]}")
end
