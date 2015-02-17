class AddTargetToPages < ActiveRecord::Migration
  def change
    add_column :pages, :target_id, :integer
  end
end

