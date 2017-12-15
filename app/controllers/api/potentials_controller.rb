class Api::PotentialsController < ApplicationController
  def index
    @potentials = current_user.user_potentials
  end

  def create

  end

  def destroy

  end
end
