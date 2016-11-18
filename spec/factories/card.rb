FactoryGirl.define do
  factory :card do
    original_text 'WTF'
    translated_text 'ВТФ'
    user
    deck
  end

  factory :user do
    email 'oleg@gmail.com'
    password 'password'
  end

  factory :deck do
    name 'deckname'
    user
  end
end
