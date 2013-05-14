class Page < ActiveRecord::Base

  default_scope order('priority ASC')

  validates_uniqueness_of :name

  before_save :update_slug

  def update_slug
    self.slug = name.parameterize
  end
end
