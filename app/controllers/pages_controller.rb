class PagesController < ApplicationController
  def home
    @bob = Bob.find(1)
  end
end
