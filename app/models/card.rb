class Card < ApplicationRecord
	validates :original_text, :translated_text, 	presence: true, 
																							uniqueness: true,
						 																confirmation: { case_sensitive: false }
						 																
end
