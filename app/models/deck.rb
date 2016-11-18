class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  belongs_to :user
  before_validation :normalize_deck, on: [:create, :edit, :update]
  validates :name, presence: true,
                uniqueness: { confirmation: true }

  def normalize_deck
    self.name = name.mb_chars.downcase
  end
end
