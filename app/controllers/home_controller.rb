class HomeController < ApplicationController
  def index
    @gym = Gym.all
  end
end
