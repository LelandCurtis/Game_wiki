class LevelsController < ApplicationController
  def index
    @levels = Level.all.order(:created_at)
  end

  def show
    @level = Level.find(params[:id])
  end
end
