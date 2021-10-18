class PagesController < ApplicationController
  def home
    @bob = Bob.find(1)
    @last_transactions = Transaction.last(5)
    @last_transaction = Transaction.last
  end

  def graphic
    transactions = Transaction.last(100)
    @eth_price = transactions.map { |set| [set[:created_at].strftime('%I:%M:%S'), (set[:price].to_f / 1000)] }.to_h
    @balance_value = transactions.map { |set| [set[:created_at].strftime('%I:%M:%S'), (set[:balance_value].to_f / 1000)] }.to_h
  end
end
