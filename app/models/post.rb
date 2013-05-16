class Post < ActiveRecord::Base
  def lead
    terminal = [299, self.body.length - 1].min

    return self.body[0..terminal]
  end
end
