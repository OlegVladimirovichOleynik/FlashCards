class HomeController < ApplicationController
  def index
    @card = Card.rand_cards.first
  end
end
