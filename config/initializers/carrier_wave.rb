unless Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET'],
      region:                'us-west-2'
      region:                'us-west-2',
    }
    config.fog_directory = ENV['AWS_BUCKET']
  end
end
