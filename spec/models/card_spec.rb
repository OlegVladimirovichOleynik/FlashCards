require 'rails_helper'
require 'carrierwave/test/matchers'
describe Card do
  let(:user) { create(:user) }
  let!(:card) { create :card, user: user }
  it 'entered the wrong text' do
    expect(card.check_translation('Nothing')).to be false
  end

  it 'entered the correct text with spaces and register' do
    expect(card.check_translation('     wtf')).to be true
  end
end
