class AddRawFileToFlags < ActiveRecord::Migration
  def change
    add_column :flags, :raw_file, :text
  end
end
