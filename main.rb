require 'dotenv/load' #environment variables for spotify
require 'stripe' #spotify library

# configure stripe
Stripe.api_key = ENV["STRIPE_TEST_KEY"]

# # 1. Charges
# response = Stripe::Charge.create({
#     :amount => 2000, #dollars in cents
#     :currency => "aud", # Australia currency
#     :source => "tok_amex", # obtained with Stripe.js
#     :description => "Charge for ruegen.aschenbrenner@coderacademy.edu.au"
# })

# puts "charge id #{response.id}"

# # 2. Retrieve charges

# charge_id = '* put charge id here* '

# response = Stripe::Charge.retrieve(charge_id)

# puts
# puts "Description: #{response.description}"
# puts "Amount: #{response.amount}"
# puts "Currency: #{response.currency}"
