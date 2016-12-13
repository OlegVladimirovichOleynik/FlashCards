set :environment, :development
every 1.days, at: '6:11 am' do
  runner "User.pending_cards"
end
