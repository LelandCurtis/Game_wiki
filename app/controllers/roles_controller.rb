class RolesController < ApplicationController
  def index
    @roles = Model.all
  end
end
