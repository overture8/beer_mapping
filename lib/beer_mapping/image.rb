module BeerMapping
  class Image
    attr_reader :url, :thumburl, :width, :height, :caption, :credit, :created_date

    def initialize(url, thumburl, width, height, caption, credit, created_date)
      @url, @thumburl, @width, @height, @caption, @credit, @created_date = url, thumburl, width, height, caption, credit, created_date
    end
  end
end
