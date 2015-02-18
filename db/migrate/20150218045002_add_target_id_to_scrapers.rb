class AddTargetIdToScrapers < ActiveRecord::Migration
  def change
    add_column :scrapers, :target_id, :integer
  end
end
