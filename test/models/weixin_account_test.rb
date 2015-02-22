require "test_helper"

class WeixinAccountTest < ActiveSupport::TestCase

  def weixin_account
    @weixin_account ||= WeixinAccount.new
  end

  def test_valid
    assert weixin_account.valid?
  end

end
