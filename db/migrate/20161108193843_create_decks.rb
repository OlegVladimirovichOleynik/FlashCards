class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    change_table :decks do |t|
      t.string :name
      t.integer :user_id
      t.integer :card_id
    end
  end
end
