require 'rails_helper'

describe 'Card', :type => :feature do
  let(:card) { FactoryGirl.create(:card) }
  it 'Chek' do
    visit root_path
    fill_in 'Enter original text', with: card.original_text
    click_button 'Проверить'
    expect(page).to have_content 'Perfect!'
  end
end
