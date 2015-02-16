class Weixin::Message
  SELF_OPEN_ID = 'gh_a584189690a0'
  def response_text_xml(to_user_id, content)
    {
      "xml"=> {
        "ToUserName"=>SELF_OPEN_ID,
        "FromUserName"=> to_user_id
        "CreateTime"=>Time.now.to_i.to_s,
        "MsgType"=>"text", 
        "Content" => content
      }
    }
  end
end