Recaptcha.configure do |config|
    if Rails.env.production?
        config.site_key = ENV['RECAPT_SITE_KEY']
        config.secret_key = ENV['RECAPT_SECRET_KEY']
    else
        config.site_key = '6LcfNBUUAAAAALwZ5hJR4Gpn9W2Ll8tB1aA3sZFF' # or put your own recaptcha key here
        config.secret_key = '6LcfNBUUAAAAAMveIbelvNiXUUfm6myVC7PEi9p8' # same
    end

end
