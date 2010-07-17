module BeerMapping
  class Rating
    attr_reader :overall, :selection, :atmosphere, :service, :food, :reviewcount, :fbscore, :fbcount

    def initialize(overall, selection, service, atmosphere, food, reviewcount, fbscore, fbcount)
      @overall, @selection, @service, @atmosphere, @food, @reviewcount, @fbscore, @fbcount = overall, selection, service, atmosphere, food, reviewcount, fbscore, fbcount
    end
  end
end
