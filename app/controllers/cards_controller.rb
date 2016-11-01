class CardsController < ApplicationController
  before_action :find_cards, only: [:edit, :update, :destroy, :show, :simple_test]

  def index
    @cards = current_user.cards.all
  end

  def show
  end

  def new
    @cards = current_user.cards.new
  end

  def edit
  end

  def create
    @cards = current_user.cards.build(cards_params)
    if @cards.save
      redirect_to @cards
    else
      render 'new'
    end
  end

  def update
    if @cards.update(cards_params)
      redirect_to @cards
    else
      render 'edit'
    end
  end

  def destroy
    @cards.destroy

    redirect_to cards_path
  end

  def simple_test
    if @cards.check_translation(cards_params[:original_text])
      flash[:notice] = 'Perfect!'
      @cards.update_review_date
    else
      flash[:error] = "The correct translation: #{@cards.original_text}. Please, try again!"
    end
    redirect_to root_url
  end

  private

  def cards_params
    params.require(:card).permit(:original_text, :translated_text)
  end

  def find_cards
    @cards = current_user.cards.find(params[:id])
  end
end
