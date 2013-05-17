class Post < ActiveRecord::Base
  def lead
    terminal = [299, self.body.length - 1].min
    
    if terminal == self.body.length - 1
      return_str = self.body 
    else
      return_str = self.body[0..terminal] + "..."
    end

    return return_str 
  end

  def tags_list
    unless self.tags.blank?
      self.tags.join(", ")
    end
  end

  def tags_list=(value)
    tag_names = value.split(/,\s+/)
    self.update_attribute(:tags, tag_names)
  end

  def self.tag_cloud(posts)
    tags = {}
    posts.each do |post|
      unless post.tags_list.blank?
        post.tags_list.split(/,\s+/).each do |tag|
          if tags.has_key? tag
            tags[tag] += 1
          else
            tags[tag] = 1
          end
        end
      end
    end

    return tags
  end
end
