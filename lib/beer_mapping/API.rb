module BeerMapping
  class API
    attr_reader :locations

    def initialize(api_key)
      $api_key = api_key
      @locations = []
    end

    def find_by_name(search_name)
      locations = open("http://beermapping.com/webservice/locquery/#{$api_key}/#{CGI.escape(search_name)}") {|f| Hpricot.XML(f) }
      get_locations(locations)
    end

    def find_by_location(search_location)
      locations = open("http://beermapping.com/webservice/loccity/#{$api_key}/#{CGI.escape(search_location)}") {|f| Hpricot.XML(f) }
      get_locations(locations)
    end

    def get_locations(locations)
      @locations.clear
      locations.search("//location").each do |location|
        lid = location.at("//id").innerText
        name = location.at("//name").innerText
        street = location.at("//street").innerText
        city = location.at("//city").innerText
        state = location.at("//state").innerText
        zip = location.at("//zip").innerText
        country = location.at("//country").innerText
        phone = location.at("//phone").innerText
        image_count = location.at("//imagecount").innerText
        @locations << Location.new(lid, name, street, city, state, zip, country, phone, image_count)
      end
    end
    private :get_locations
  end
end
