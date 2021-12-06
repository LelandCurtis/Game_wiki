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
    role = Role.create(role_params)
    redirect_to "/roles"
  end

  def edit
    @role = Role.find(params[:role_id])
  end

  def update
    @role = Role.find(params[:role_id])
    @role.update(role_params)
    redirect_to "/roles/#{@role.id}"
  end

  private

  def role_params
    params.permit(:name, :unlocked, :health)
  end
end
