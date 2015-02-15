class CreateScrapers < ActiveRecord::Migration
  def change
    create_table :scrapers do |t|
      t.string :url
      t.string :response

      t.timestamps
    end
  end
end
