class RemoveCurrentDeckFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :current_deck, :boolean
  end
end
