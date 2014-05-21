module TestResultDetailsHelper
  def ihash(h)
    h.each_pair do |k,v|
      if v.is_a?(Hash)
        ihash(v)
      else
      end
    end
  end

  def nested_messages(messages)
    messages.map do |message, sub_messages|
      render(message) + content_tag(:div, nested_messages(sub_messages), :class => "nested_messages")
    end.join.html_safe
  end
end
