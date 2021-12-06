class LevelMonstersController < ApplicationController
  def index
    @level = Level.find(params[:level_id])
    @monsters = @level.monsters
  end

  def new
      @level = Level.find(params[:level_id])
  end

  def create
    @level = Level.find(params[:level_id])
    @level.monsters.create(name: params[:name], enraged: params[:enraged], health: params[:health])
    redirect_to "/levels/#{@level.id}/monsters"
  end

  
end
