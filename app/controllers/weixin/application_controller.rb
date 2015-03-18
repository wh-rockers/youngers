require 'CGI'
require 'open-uri'
class Weixin::ApplicationController < ApplicationController
  include WeixinConcerns
  layout 'weixin'
  
end