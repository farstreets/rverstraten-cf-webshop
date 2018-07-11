if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_yZqiDzwtWTawEGyvUoml5cTY',
    secret_key: 'sk_test_9ikoqPIEPnKXwYg7kCGvMrg7'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

# You can reference your Stripe credentials as follows anywhere in your app:
# Rails.configuration.stripe[:publishable_key]
