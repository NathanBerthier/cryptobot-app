require 'coinbase/wallet'
class Crypto
  def initialize(attributes = {})
    @symbol = attributes[:symbol]
  end

  def price
    client = Coinbase::Wallet::Client.new(api_key: ENV['COINBASE_API_KEY'], api_secret: ENV['COINBASE_API_SECRET'])
    crypto_data = client.buy_price({ currency_pair: "#{@symbol.upcase}-USD" })
    crypto_data['amount'].to_f
  end
end
