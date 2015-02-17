class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string  :name
      t.string  :base_url
      t.string  :sanitize_options
      t.integer :default_depth

      t.timestamps
    end
  end
end
