class Card < ApplicationRecord
	before_validation :normalize_name, on: :create
	before_validation do
		self.created_at = Date.today.next_day(3)
	end

	validates :original_text, exclusion: { in: :translated_text,
     message: "is reserved." }

	validates :original_text, :translated_text, 	presence: true, 
																							uniqueness: true,
						 																confirmation: { case_sensitive: false }
  protected
    def normalize_name
      self.original_text = original_text.mb_chars.downcase.titleize
      self.translated_text = translated_text.mb_chars.	downcase.titleize
    end
					 																
end