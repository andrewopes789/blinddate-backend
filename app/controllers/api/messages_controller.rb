class Api::MessagesController < ApplicationController
  def index
    @messages = current_user.sent_messages + current_user.received_messages
  end

  def create
    sender_id = current_user.id
    recipient_id = params[:user_id]
    @message = Message.new(sender_id: sender_id, recipient_id: recipient_id, body: message_params[:body])

    if @message.save
      render :show
    else
      render json: @message.errors.full_messages
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
