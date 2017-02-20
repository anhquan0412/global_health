Recaptcha.configure do |config|
    if Rails.env.production?
        config.site_key = ENV['RECAPT_SITE_KEY']
        config.secret_key = ENV['RECAPT_SECRET_KEY']
    else
      config.site_key = '6LcdohEUAAAAAAqWhCKFIrgDkSvP1Hls4eJVpxAG' # or put your own recaptcha key here
      config.secret_key = '6LcdohEUAAAAANxUmWVSTP75vbnTQ0Xif0RoK_J9' # same
    end

end
