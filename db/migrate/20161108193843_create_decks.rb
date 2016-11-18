class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    change_table :decks do |t|
      t.string :name
      t.integer :user_id
      t.integer :card_id
    end
  end

  def change
    add_column :cards, :deck_id, :integer
  end

  def change
    add_index :cards, :user_id
    add_index :cards, :deck_id
  end

  def change
    add_column :decks, :current_deck, :boolean
  end

  def change
    remove_column :decks, :current_deck, :boolean
  end

  def change
    add_column :users, :current_deck, :boolean
  end

  def change
    remove_column :users, :current_deck, :boolean
  end

  def change
    add_column :users, :current_deck_id, :integer
  end
  
end
