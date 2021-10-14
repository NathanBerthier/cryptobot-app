class PagesController < ApplicationController
  def home
    @bob = Bob.find(1)
    @last_transactions = Transaction.last(5)
    @last_transaction = Transaction.last
  end
end
