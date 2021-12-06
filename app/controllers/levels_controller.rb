class LevelsController < ApplicationController
  def index
    @levels = Level.all.order(:created_at)
  end

  def show
    @level = Level.find(params[:id])
    @count_of_monsters_level = @level.monsters.count
  end

  def new

  end

  def create
    create_level = Level.create(level_params)
    redirect_to "/levels"
  end

  def edit
    @level = Level.find(params[:level_id])
  end

  def update
    @level = Level.find(params[:level_id])
    @level.update(level_params)
    redirect_to "/levels/#{@level.id}"
  end

  private

  def level_params
    params.permit(:name, :boss, :difficulty)
  end
end
