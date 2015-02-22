class Weixin::MessagesController < Weixin::ApplicationController
  before_action :authentication
  skip_before_filter :verify_authenticity_token
  
  def index
    @messages = Message.all
  end

  def receive
    if request.post?
      xml = (Hash.from_xml request.body.read).fetch('xml')
      render xml: Weixin::Message.new(xml).response
    else
      render text: params[:echostr]
    end
  end
end