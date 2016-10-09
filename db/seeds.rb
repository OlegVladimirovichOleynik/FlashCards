# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

#url = 'http://www.languagedaily.com/learn-german/vocabulary/common-german-words'
#url ='http://wooordhunt.ru/dic/list/en_ru/ap'
url ='http://sanstv.ru/english_words'
#url ='http://english-dictionary.ru/07/'
html = open(url)

doc = Nokogiri::HTML(html)

doc.css("tr").each do |tr|
	original_text = tr.css("td:nth-child(4)").text
	translated_text = tr.css("td:nth-child(6)").text.encode("ISO-8859-1")
	#puts translated_text
	Card.create(original_text: original_text, translated_text: translated_text)
end