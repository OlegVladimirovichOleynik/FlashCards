class Dashboard::CardsController < ApplicationController
  before_action :find_cards, only: [:edit, :update, :destroy, :show, :simple_test]

  def index
    @cards = current_user.cards.all
  end

  def show; end

  def new
    @cards = current_user.cards.new
  end

  def edit; end

  def create
    @cards = current_user.cards.build(cards_params)
    if @cards.save
      redirect_to dashboard_cards_path
    else
      render 'new'
    end
  end

  def update
    if @cards.update(cards_params)
      redirect_to dashboard_cards_path
    else
      render 'edit'
    end
  end

  def destroy
    @cards.destroy

    redirect_to dashboard_cards_path
  end

  def simple_test
    if @cards.check_translation(cards_params[:original_text])
      case @cards.check_typos(cards_params[:original_text])
      when 0 then flash[:notice] = t(:perfect)
      when 1 then flash[:error] = t(:error, correct: @cards.original_text, your: cards_params[:original_text].mb_chars.downcase.titleize)
      else
        flash[:error] = t(:error2, correct: @cards.original_text)
      end
    end
    redirect_to root_url
  end

  private

  def cards_params
    params.require(:card).permit(:original_text, :translated_text, :review_date, :avatar, :deck_id)
  end

  def find_cards
    @cards = current_user.cards.find(params[:id])
  end
end
