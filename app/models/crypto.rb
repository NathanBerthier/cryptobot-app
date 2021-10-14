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

  def buy(balance_dai, dai_price, eth_price)
    balance_value = (balance_dai * dai_price)
    Transaction.create(price: eth_price * 1000,
                       time: DateTime.current,
                       balance_value: balance_value * 1000,
                       transaction_type: 'buy')
    balance_value / eth_price
  end

  def sell(balance_eth, eth_price, dai_price)
    balance_value = (balance_eth * eth_price)
    Transaction.create(price: eth_price * 1000,
                       time: DateTime.current,
                       balance_value: balance_value * 1000,
                       transaction_type: 'sell')
    balance_value / dai_price
  end
end
