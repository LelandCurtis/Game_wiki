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
    Weapon.create(name: params[:name], ranged_attack: params[:ranged_attack], fire_rate: params[:fire_rate], damage: params[:damage])
    redirect_to "/roles/#{@role.id}/weapons"
  end
end
