class LevelMonstersController < ApplicationController
  def index
    @level = Level.find(params[:level_id])
    if params[:by_name]
      @monsters = @level.monsters_by_name
    else
      @monsters = @level.monsters
    end
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
