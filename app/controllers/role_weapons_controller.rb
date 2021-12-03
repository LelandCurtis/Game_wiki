class RoleWeaponsController < ApplicationController
  def index
    @role = Role.find(params[:id])
    @weapons = @role.weapons
  end
end
