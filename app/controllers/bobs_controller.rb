class BobsController < ApplicationController
  def update
    bob = Bob.find(1)
    bob.status = bob.switch_status
    bob.save
    bob.work if bob.status == 'working'
    redirect_to root_path
  end
end
