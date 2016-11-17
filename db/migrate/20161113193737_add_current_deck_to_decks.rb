class AddCurrentDeckToDecks < ActiveRecord::Migration[5.0]
  def change
    add_column :decks, :current_deck, :boolean
  end
end
