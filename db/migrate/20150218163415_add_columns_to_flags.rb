class AddColumnsToFlags < ActiveRecord::Migration
  def change
    add_column :flags, :highlight, :text
    add_column :flags, :url, :text
    add_column :flags, :score, :float
  end
end
