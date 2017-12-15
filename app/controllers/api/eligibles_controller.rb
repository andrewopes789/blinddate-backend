class Api::EligiblesController < ApplicationController
  def index
    @eligibles = current_user.user_eligibles
  end

  def create
    user_id = current_user.id
    eligible_id = params[:user_id]
    @eligible = Eligible.new(user_id: user_id, eligible_id: eligible_id)

    if @eligible.save
      render :show
    else
      render json: @eligible.errors.full_messages, status: 422
    end
  end

  def destroy
    @eligible = Eligible.find_by(user_id: current_user.id, eligible_id: params[:id])

    if @eligible.delete
      render :show
    else
      render json: @eligible.errors.full_messages, status: 422
    end
  end
end
