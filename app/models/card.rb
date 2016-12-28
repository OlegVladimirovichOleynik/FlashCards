class Card < ApplicationRecord
  belongs_to :user
  belongs_to :decks
  mount_uploader :avatar, AvatarUploader
  before_validation :normalize_name, on: [:create, :edit, :update]

  before_create do
    self.review_date = Time.current
    self.repeat = 1
  end

  scope :expired, -> { where("review_date <= ?", DateTime.current) }
  scope :rand_cards, -> { expired.order('RANDOM()') }

  validates :original_text, exclusion: { in: :translated_text, message: "is reserved." }

  validates :deck_id, presence: true

  validates :original_text, :translated_text, presence: true,
                                              uniqueness: { scope: :user_id },
                                              confirmation: true

  def check_translation(text)
    original_text.strip.eql?(text.strip.downcase.titleize)
    typos = check_typos(text)
    results = SuperMemo.new.calculation(text, typos, repeat, efactor)
    update(results)
  end

  def check_typos(text)
    Levenshtein.distance(original_text, text.strip.downcase.titleize)
  end

  protected

  def normalize_name
    self.original_text = original_text.mb_chars.strip.downcase.titleize
    self.translated_text = translated_text.mb_chars.strip.downcase.titleize
  end
end
