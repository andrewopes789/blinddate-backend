class Api::MatchesController < ApplicationController
  def index
    @matches = current_user.user_matches
  end

  def create
    user_id = current_user.id
    match_id = params[:user_id]
    @match = Match.new(user_id: user_id, match_id: match_id)

    if @match.save
      render :show
    else
      render json: @match.errors.full_messages, status: 422
    end
  end

  def destroy
    @match = Match.find_by(user_id: current_user.id, match_id: params[:id])

    if @match.delete
      render :show
    else
      render json: @match.errors.full_messages, status: 422
    end
  end
end
