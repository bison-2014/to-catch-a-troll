class AddRawFileToPages < ActiveRecord::Migration
  def change
    add_column :pages, :raw_file, :text
  end
end
