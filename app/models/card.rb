class Card < ApplicationRecord
	before_validation :normalize_name, on: [ :create, :update ]
	before_create do
    self.created_at = 3.days.from_now
  end

	validates :original_text, :translated_text,	presence: true,
                                              uniqueness: { case_sensitive: false }
                                             	
  validates :translated_text, exclusion: { in: :original_text, case_sensitive: false }
	
	protected
    def normalize_name
      self.original_text= original_text.mb_chars.downcase.titleize
      self.translated_text = translated_text.mb_chars.downcase.titleize
    end
end
