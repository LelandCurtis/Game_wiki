class LevelMonstersController < ApplicationController
  def index
    @level = Level.find(params[:level_id])
    @monsters = @level.monsters
  end
end
