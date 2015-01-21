class Weixin::MessagesController < Weixin::ApplicationController
  def index
    @messages = Message.all
  end

  def receive
    if request.post?
      render text: 'ok'
    else
      render text: params[:echostr]
    end
  end

end