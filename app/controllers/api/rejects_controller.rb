class Api::RejectsController < ApplicationController
  def index
    @rejects = current_user.user_rejects
  end

  def create
    user_id = current_user.id
    reject_id = params[:user_id]
    @reject = Reject.new(user_id: user_id, reject_id: reject_id)

    if @reject.save
      render :show
    else
      render json: @reject.errors.full_messages, status: 422
    end
  end
end
