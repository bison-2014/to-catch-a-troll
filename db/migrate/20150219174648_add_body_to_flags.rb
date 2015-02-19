class AddBodyToFlags < ActiveRecord::Migration
  def change
    add_column :flags, :body, :text
  end
end
