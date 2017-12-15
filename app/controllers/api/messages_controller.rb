class Api::MessagesController < ApplicationController
  def index
    @messages = User.find(params[:user_id]).sent_messages + User.find(params[:user_id]).received_messages
  end

  def create
    sender_id = current_user.id
    recipient_id = params[:user_id]

    @message = Message.new(
      sender_id: sender_id,
      recipient_id: recipient_id,
      body: message_params[:inputMessage],
      mess: message_params[:mess])

    if @message.save
      render :show
    else
      render json: @message.errors.full_messages
    end
  end

  private

  def message_params
    params.permit(:inputMessage, :mess)
  end
end
