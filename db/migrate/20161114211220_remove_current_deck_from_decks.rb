class RemoveCurrentDeckFromDecks < ActiveRecord::Migration[5.0]
  def change
    remove_column :decks, :current_deck, :boolean
  end
end
