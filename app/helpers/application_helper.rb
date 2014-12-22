# coding: utf-8
module ApplicationHelper
  def timeago(time, options = {})
    options[:class] = options[:class].blank? ? "timeago" : [options[:class],"timeago"].join(" ")
    options.merge!(title: time.iso8601)
    content_tag(:abbr, "", class: options[:class], title: time.iso8601) if time
  end
end
