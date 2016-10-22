class Card < ApplicationRecord
  before_validation :normalize_name, on: [:create, :edit, :update] do
    self.created_at = Date.today.next_day(3)
  end
  scope :rand_cards, -> { where('created_at <= ?', Date.today).order('RANDOM()').first }

  validates :original_text, exclusion: { in: :translated_text,
                                    message: "is reserved." }

  validates :original_text, :translated_text, presence: true,
                                              uniqueness: { case_sensitive: false },
                                              confirmation: true
  def check_translation(text)
    original_text.strip.eql?(text.strip.downcase.titleize)
  end

  def update_date
    update(created_at: 3.days.from_now)
  end

  protected

  def normalize_name
    self.original_text = original_text.mb_chars.strip.downcase.titleize
    self.translated_text = translated_text.mb_chars.strip.downcase.titleize
  end
end
