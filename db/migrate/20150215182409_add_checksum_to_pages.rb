class AddChecksumToPages < ActiveRecord::Migration
  def change
    add_column :pages, :checksum, :string
  end
end
