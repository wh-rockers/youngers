class Weixin::Message
  SELF_OPEN_ID = 'gh_a584189690a0'
  attr_reader :to_user_name, :from_user_name, :create_time, :msg_type, :event, :event_key, :ticket 

  def initialize(xml)
    message_attrs.each do |attr|
      instance_variable_set("@#{attr.underscore}", xml.fetch(attr, nil))
    end
  end

  def response
    case 
    when subscribe? then response_subscribe
    when unsubscribe? then response_text_xml('取消关注')
    when scan_log_in? then response_text_xml('登陆成功')
    else response_text_xml('无法识别')
    end
  end

  private

  def response_subscribe
    account = WeixinAccount.find_or_create_by(open_id: from_user_name)
    response_text_xml('谢谢关注')
  end

  def response_text_xml(content)
    {
      "xml"=> {
        "ToUserName"=> from_user_name,
        "FromUserName"=> SELF_OPEN_ID,
        "CreateTime"=>Time.now.to_i.to_s,
        "MsgType"=>"text", 
        "Content" => content
      }
    }.to_xml
  end

  def subscribe?
    event == 'subscribe'
  end

  def scan_log_in?
    event_key == '123'
  end

  def unsubscribe?
    event == "unsubscribe"
  end

  def message_attrs
    ['ToUserName', 'FromUserName', 'CreateTime','MsgType','Event', 'EventKey', 'Ticket']
  end
end

# scan in web to log in, -- "Event"=>"SCAN", "EventKey"=>"123"