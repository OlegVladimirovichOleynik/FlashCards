require 'rails_helper'
describe Card do
  let(:user) { create(:user) }
  let!(:deck) { create :deck, user: user }
  let!(:card) { create :card, user: user, deck_id: deck.id }
  it 'entered the wrong text' do
    card.check_translation('Nothing')
    expect(card.repeat).to eq 1
  end

  it 'entered the correct text with spaces and register' do
    expect(card.check_translation('     wtf')).to be true
  end

  it 'increment from inc_repeat an dec_repeat' do
    card.check_translation('wtf')
    expect(card.repeat).to eq 2
    card.check_translation('wtf')
    expect(card.repeat).to eq 3
    card.check_translation('Nothing')
    expect(card.repeat).to eq 1
  end
end
