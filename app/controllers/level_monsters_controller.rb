class LevelMonstersController < ApplicationController
  def index
    @level = Level.find(params[:level_id])
    @monsters = @level.monsters
  end

  def new
  end

  def create
    create_level_monster = Monster.create(name: params[:name], enraged: params[:enraged], health: params[:health] )
    redirect_to "/levels"
  end
end
