class Weixin::MessagesController < Weixin::ApplicationController
  def index
    @messages = Message.all
  end

  def receive
    if request.post?
      xml = Hash.from_xml request.body.read
      p '====================='
      p xml
      render text: 'ok'
    else
      render text: params[:echostr]
    end
  end
end