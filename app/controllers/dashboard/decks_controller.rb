class Dashboard::DecksController < ApplicationController
  before_action :find_decks, only: [:edit, :update, :destroy, :show]

  def index
    @decks = current_user.decks.all
  end

  def new
    @decks = current_user.decks.new
  end

  def create
    @decks = current_user.decks.build(decks_params)
    if @decks.save
      redirect_to dashboard_decks_path
    else
      render :new
    end
  end

  def update
    if @decks.update(decks_params)
      redirect_to dashboard_decks_path
    else
      render 'edit'
    end
  end

  def destroy
    @decks.destroy
    redirect_to dashboard_decks_path
  end

  def edit; end

  def show; end

  private

  def find_decks
    @decks = current_user.decks.find(params[:id])
  end

  def decks_params
    params.require(:deck).permit(:name)
  end
end
