class AddPriorityToPages < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.integer :priority
    end
  end
end
