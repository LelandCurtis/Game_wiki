class RoleWeaponsController < ApplicationController
  def index
    @role = Role.find(params[:role_id])
    if params[:by_name]
      @weapons = @role.weapons_by_name
    else
      @weapons = @role.weapons
    end
  end

  def new
    @role = Role.find(params[:role_id])
  end

  def create
    @role = Role.find(params[:role_id])
    @role.weapons.create(weapons_params)
    redirect_to "/roles/#{@role.id}/weapons"
  end

  private

  def weapons_params
    params.permit(:name, :ranged_attack, :fire_rate, :damage)
  end
end
