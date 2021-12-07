class RoleWeaponsController < ApplicationController
  def index
    @role = Role.find(params[:role_id])
    @weapons = @role.weapons
  end

  def new
    @role = Role.find(params[:role_id])
  end

  def create
    @role = Role.find(params[:role_id])
    @role.weapons.create(weapons_params)
    redirect_to "/roles/#{@role.id}/weapons"
  end

  def index_by_name
    @role = Role.find(params[:role_id])
    @weapons = @role.weapons.by_name
    redirect_to "/roles/#{@role.id}/weapons"
  end


  private

  def weapons_params
    params.permit(:name, :ranged_attack, :fire_rate, :damage)
  end
end
