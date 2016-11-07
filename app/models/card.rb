class Card < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  before_validation :normalize_name, on: [:create, :edit, :update]

  before_create do
    self.review_date = 0.days.from_now
  end

  scope :rand_cards, -> { where('review_date <= ?', Date.today).order('RANDOM()') }

  validates :original_text, exclusion: { in: :translated_text, message: "is reserved." }

  validates :original_text, :translated_text, presence: true,
                                              uniqueness: { scope: :user_id },
                                              confirmation: true
  def check_translation(text)
    original_text.strip.eql?(text.strip.downcase.titleize)
  end

  def update_review_date
    update(review_date: 3.days.from_now)
  end

  protected

  def normalize_name
    self.original_text = original_text.mb_chars.strip.downcase.titleize
    self.translated_text = translated_text.mb_chars.strip.downcase.titleize
  end
end
