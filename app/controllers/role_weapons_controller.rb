class RoleWeaponsController < ApplicationController
  def index
    @role = Role.find(params[:role_id])
    @weapons = @role.weapons
  end

  def new
    @role = Role.find(params[:role_id])
  end
end
