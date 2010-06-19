module BeerMapping
  class Location
    attr_reader :id, :name, :street, :city, :state, :zip, :country, :phone, :image_count

    def initialize(id, name, street, city, state, zip, country, phone, image_count)
      @id, @name, @street, @city, @state, @zip, @country, @phone, @image_count = id, name, street, city, state, zip, country, phone, image_count
      @images ||= []
    end

    def geo
      # Lazy load geo data
      unless instance_variable_defined? :@geo
        geo = open("http://beermapping.com/webservice/locmap/#{$api_key}/#{@id}") {|f| Hpricot.XML(f) }
        lat = geo.at("//location/lat").innerText
        lng = geo.at("//location/lng").innerText
        map = geo.at("//location/map").innerText
        altmap = geo.at("//location/altmap").innerText
        @geo = Geo.new(lat, lng, map, altmap)
      else
        @geo
      end
    end

    def images
      # Lazy load images
      if @images.size == 0
        images = open("http://beermapping.com/webservice/locimage/#{$api_key}/#{@id}") {|f| Hpricot.XML(f) }
        images.search("//location").each do |image|
          url = image.at("//imageurl").innerText
          thumburl = image.at("//thumburl").innerText
          width = image.at("//width").innerText
          height = image.at("//height").innerText
          caption = image.at("//caption").innerText
          credit = image.at("//credit").innerText
          created_date = image.at("//imagedate").innerText
          @images << Image.new(url, thumburl, width, height, caption, credit, created_date)
        end
      else
        @images
      end
    end

    def ratings
      # Lazy load ratings
      unless instance_variable_defined? :@ratings
        ratings = open("http://beermapping.com/webservice/locscore/#{$api_key}/#{@id}") {|f| Hpricot.XML(f) }
        overall = ratings.at("//location/overall").innerText
        selection = ratings.at("//location/selection").innerText
        service = ratings.at("//location/service").innerText
        atmosphere = ratings.at("//location/atmosphere").innerText
        food = ratings.at("//location/food").innerText
        reviewcount = ratings.at("//location/reviewcount").innerText
        fbscore = ratings.at("//location/fbscore").innerText
        fbcount = ratings.at("//location/fbcount").innerText
        @ratings = Rating.new(overall, selection, service, atmosphere, food, reviewcount, fbscore, fbcount)
      else 
        @ratings
      end
    end
  end
end
