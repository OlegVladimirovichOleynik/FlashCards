require 'rails_helper'

describe 'Card', type: :feature do
  let!(:card) { create(:card) }

  before do
    card.update(review_date: Date.today)
  end

  it 'check correct translation' do
    visit root_path
    fill_in 'card_original_text', with: card.original_text
    click_button 'Проверить'
    card.reload
    expect(card.review_date).to eq 3.days.from_now.to_date
    expect(page).to have_content 'Perfect!'
  end

  it 'check wrong translation' do
    visit root_path
    fill_in 'card_original_text', with: 'test'
    click_button 'Проверить'
    card.reload
    expect(card.review_date).to eq Date.today
  end
end
