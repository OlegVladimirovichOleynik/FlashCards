class AddIndexToCards < ActiveRecord::Migration[5.0]
  def change
    add_index :cards, :user_id
    add_index :cards, :deck_id
  end
end
