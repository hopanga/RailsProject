if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_QQM0qhl9rsrsoXkcrssScVSa',
    :secret_key => 'sk_test_QJvgA0ae57GZ8ber5eGM9s4e'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]