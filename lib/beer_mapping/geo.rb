module BeerMapping
  class Geo
    attr_reader :lat, :lng, :map, :altmap

    def initialize(lat, lng, map, altmap)
      @lat, @lng, @map, @altmap = lat, lng, map, altmap
    end
  end
end
