FactoryGirl.define do
  factory :card do
    original_text 'WTF'
    translated_text 'ВТФ'
  end

  factory :user do
    email 'oleg@gmail.com'
    password 'password'
  end

end
