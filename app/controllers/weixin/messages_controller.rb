class Weixin::MessagesController < Weixin::ApplicationController
  def index
    @messages = Message.all
  end

  def receive
    if request.post?
      puts request
      render text: 'ok'
    else
      puts request
      render text: params[:echostr]
    end
  end

end