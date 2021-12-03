class RolesController < ApplicationController
  def index
    @roles = Role.all.order(:created_at)
  end

  def show
    @role = Role.find(params[:id])
  end
end
