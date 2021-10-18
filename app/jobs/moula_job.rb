class MoulaJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false

  def perform
    moula
    bob_sleeping
    puts "I'm sleeping"
  end

  def moula # rubocop:disable Metrics/MethodLength,Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity,Metrics/AbcSize
    eth = Crypto.new(symbol: 'eth')
    dai = Crypto.new(symbol: 'dai')

    reference_price = eth.price
    balance_dai     = 500
    balance_eth     = 0
    up_count        = 0

    loop do
      sleep(5)
      eth_price = eth.price
      dai_price = dai.price
      direction = market_side(reference_price, eth_price)

      if can_buy?(direction, balance_dai) && up_count == 1
        balance_eth = eth.buy(balance_dai, dai_price, eth_price)
        balance_dai = 0
        up_count = 0
      elsif can_buy?(direction, balance_dai) && up_count != 1 && eth_price != reference_price
        up_count += 1
      elsif can_sell?(direction, balance_dai) && eth_price != reference_price
        balance_dai = eth.sell(balance_eth, eth_price, dai_price)
        balance_eth = 0
        up_count = 0
      elsif direction.negative? && balance_dai.positive? && eth_price != reference_price
        up_count = 0
      end

      reference_price = eth_price
      break if read_bob_status == 'waiting'
    end
  end

  def market_side(reference_price, eth_price)
    reference_price >= eth_price ? -1 : 1
  end

  def can_buy?(direction, balance_dai)
    direction.positive? && balance_dai.positive?
  end

  def can_sell?(direction, balance_dai)
    direction.negative? && balance_dai.zero?
  end

  def read_bob_status
    bob_status_file = File.join(Rails.root, 'app', 'jobs', 'bob_status.txt')
    File.read(bob_status_file)
  end

  def bob_waiting?
    bob = Bob.last
    bob.status == 'waiting'
  end

  def bob_sleeping
    bob = Bob.last
    bob.status = 'sleeping'
    bob.save
    File.write("#{Rails.root}/app/jobs/bob_status.txt", '')
  end
end
