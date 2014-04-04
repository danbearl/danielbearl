module ApplicationHelper

  def flash_class(level)

    case level
    when :notice then "info"
    when :error then "error"
    when :alert then "warning"
    end

  end

  def tag_cloud(tags, classes)
    max = tags.sort_by{|k,v| v}.last[1]

    tags.each do |tag, count|
      index = count.to_f / max * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end

  private

  def active_link_to(text, path, options={})
    if /^#{url_for(path)}/ =~ request.path
      options[:class] = "#{options[:class]} active"
    end
    
    link_to text, path, options
  end

end
