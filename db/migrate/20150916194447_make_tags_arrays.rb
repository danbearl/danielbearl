class MakeTagsArrays < ActiveRecord::Migration
  def change
    change_column :posts, :tags, :text, array: true, default: []
  end
end
