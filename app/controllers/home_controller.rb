class HomeController < ApplicationController
  def index
    @cards = Card.rand_cards
  end
end
