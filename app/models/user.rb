class User < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :decks, dependent: :destroy
  has_many :authentications, dependent: :destroy
  belongs_to :current_deck, class_name: "Deck", foreign_key: "current_deck_id"
  before_validation :normalize_email, on: [:create, :edit, :update]

  def current_deck_check
    current_deck ? current_deck.cards.rand_cards.first : cards.rand_cards.first
  end

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  accepts_nested_attributes_for :authentications

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email

  private

  def normalize_email
    self.email = email.strip.downcase
  end
end
