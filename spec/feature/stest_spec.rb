require 'rails_helper'

describe 'Card', type: :feature do
  let(:user) { create(:user) }
  let!(:deck) { create :deck, user: user }
  let!(:card) { create :card, user: user, deck_id: deck.id }

  before(:each) do
    login("oleg@gmail.com", "password")
  end
  before do
    card.update(review_date: Time.current)
  end

  it 'check correct translation' do
    visit root_path
    fill_in 'card_original_text', with: card.original_text
    click_button 'Проверить'
    card.reload
    expect(card.review_date) == 12.hours.from_now.to_date
    expect(page).to have_content 'Превосходно!'
  end

  it 'check wrong translation' do
    visit root_path
    fill_in 'card_original_text', with: 'test'
    click_button 'Проверить'
    card.reload
    expect(card.review_date) == Time.current
  end

  it 'registration and automatic login' do
    visit root_path
    click_link "Выйти"
    click_link "Регистрация"
    fill_in 'user_email', with: 'new_email'
    fill_in 'user_password', with: 'new_password'
    click_button 'Зарегистрироваться'
    expect(page).to have_content 'Вы вошли как: '
  end

  it 'entered the wrong text' do
    expect(card.check_translation('Nothing'))
    expect(card.repeat).to eq 1
  end

  it 'entered the correct text with spaces and register' do
    expect(card.check_translation('     wtf')).to be true
  end
end
