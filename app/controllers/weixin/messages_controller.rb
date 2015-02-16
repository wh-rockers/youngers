class Weixin::MessagesController < Weixin::ApplicationController
  def index
    @messages = Message.all
  end

  def receive
    if request.post?
      @xml = Hash.from_xml request.body.read
      p @xml
      if scan_qr_code_in_register?
        response_scan_qr_code_in_register
      end
    else
      render text: params[:echostr]
    end
  end

  private

  def scan_qr_code_in_register?
    @xml['EventKey'] == '123'
  end

  def response_scan_qr_code_in_register
    if bind_open_id?
      # sign_in User.find_by(open_id: xml['FromUserName'])
      render xml: Weixin::Message.new.response_text_xml(@xml['FromUserName'], '登录成功') and return
    else
      render xml: Weixin::Message.new.response_text_xml(@xml['FromUserName'], '该微信账号为绑定， 请通过菜单登录') and return
    end
  end

  def bind_open_id?
    User.exists?(open_id: xml['FromUserName'])
  end
end