class RolesController < ApplicationController
  def index
    @roles = Role.all.order(:created_at)
  end

  def show
    @role = Role.find(params[:id])
    @role_weapons_count = @role.weapons.count
  end

  def new

  end

  def create
    role = Role.create(name: params[:name], unlocked: params[:unlocked], health: params[:health])
    redirect_to "/roles"
  end

  def edit

  end
end
