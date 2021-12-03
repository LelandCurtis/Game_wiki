class RoleWeaponsController < ApplicationController
  def index
    @role = Role.find(params[:id])
    @weapons = Role.get_weapons(params[:id])
  end
end
