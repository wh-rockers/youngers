require "test_helper"

class TopicCommentTest < ActiveSupport::TestCase

  def topic_comment
    @topic_comment ||= TopicComment.new
  end

  def test_valid
    assert topic_comment.valid?
  end

end
