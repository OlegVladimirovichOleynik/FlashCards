class AddDetailsToCards < ActiveRecord::Migration[5.0]
  def change
    change_column :cards, :repeat, :integer, default: 1
  end
end
