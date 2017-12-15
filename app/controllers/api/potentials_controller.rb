class Api::PotentialsController < ApplicationController
  def index
    @potentials = current_user.user_potentials
  end

  def create
    user_id = current_user.id
    potential_id = params[:user_id]
    @potential = Potential.new(user_id: user_id, potential_id: potential_id)

    if @potential.save
      render :show
    else
      render json: @potential.errors.full_messages, status: 422
    end
  end

  def destroy
    @potential = Potential.find_by(user_id: current_user.id, potential_id: params[:id])

    if @potential.delete
      render :show
    else
      render json: @potential.errors.full_messages, status: 422
    end
  end
end
