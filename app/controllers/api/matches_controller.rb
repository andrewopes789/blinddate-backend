class Api::MatchesController < ApplicationController
  def index
    @matches = current_user.user_matches
  end

  def create

  end

  def destroy

  end
end
