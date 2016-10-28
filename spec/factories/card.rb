FactoryGirl.define do
  factory :card do
    original_text 'WTF'
    translated_text 'ВТФ'
    user_id 1
  end

  factory :user do
    email 'oleg@gmail.com'
    password 'password'
  end

end
