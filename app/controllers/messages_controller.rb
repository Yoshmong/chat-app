class MessagesController < ApplicationController

  def index
      @message = Message.new
      @room = Room.find(params[:room_id]) #パスにroom_idが含まれているため,paramsに含まれているroom_idを代入
      @messages = @room.messages.includes(:user) #ルームに紐付く全メッセージ（@room.messages）を@messagesと定義,includesでユーザー情報を1度のアクセスでまとめて取得
    end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end