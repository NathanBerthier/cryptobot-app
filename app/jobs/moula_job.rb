class MoulaJob < ApplicationJob
  queue_as :default

  def perform
    bob = Bob.find(1)
    puts "I'm starting the fake job"
    sleep 10
    puts "OK I'm done now"
    bob.status = 'waiting'
    bob.save
  end
end
