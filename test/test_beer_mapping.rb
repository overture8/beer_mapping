require 'helper'
TEST_KEY = 'bdf79cbc8aa8d866b77dccfe9349815e'

class TestBeerMapping < Test::Unit::TestCase
  context "A new beer search" do
    setup do
      @beer = BeerMapping::API.new(TEST_KEY)
      @beer.find_by_location("chicago")
    end

    should "return a pub from chicago when searching by location, chicago" do
      assert_equal @beer.locations[0].city, 'Chicago'
    end

    should "have a geo location" do
      assert !@beer.locations[0].geo.nil?
    end

    should "have image attributes if an image is present" do
      if !@beer.locations[0].images.nil?
        assert !@beer.locations[0].images[0].url.nil?
        assert !@beer.locations[0].images[0].thumburl.nil?
        assert !@beer.locations[0].images[0].caption.nil?
        assert !@beer.locations[0].images[0].height.nil?
        assert !@beer.locations[0].images[0].width.nil?
      end
    end

    should "have rating attributes if a rating is present" do
      if !@beer.locations[0].ratings.nil?
        assert !@beer.locations[0].ratings.service.nil?
        assert !@beer.locations[0].ratings.atmosphere.nil?
        assert !@beer.locations[0].ratings.selection.nil?
        assert !@beer.locations[0].ratings.overall.nil?
      end
    end
  end
end
