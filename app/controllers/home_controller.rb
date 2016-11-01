class HomeController < ApplicationController
  before_filter :require_login, only: :secret

  def index
    if current_user
    @card = current_user.cards.rand_cards.first
  end
  end

  def secret
  end
end
