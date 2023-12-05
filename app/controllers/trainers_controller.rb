class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def show
  end
end
