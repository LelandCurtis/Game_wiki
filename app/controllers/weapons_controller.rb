class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def show
    @weapon = Weapon.find(params[:id])
  end

  def edit
    @weapon = Weapon.find(params[:id])
    @weapon.update(weapon_params)
    redirect "weapons/#{weapon.id}"
  end

  private

  def weapon_params
    params.permit(:name, :ranged_attack, :fire_rate, :damage)
  end
end
