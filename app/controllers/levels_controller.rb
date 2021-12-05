class LevelsController < ApplicationController
  def index
    @levels = Level.all.order(:created_at)
  end

  def show
    @level = Level.find(params[:id])
    @count_of_monsters_level = @level.monsters.count
  end

  de
end
