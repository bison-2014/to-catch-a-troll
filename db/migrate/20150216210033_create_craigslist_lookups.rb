class CreateCraigslistLookups < ActiveRecord::Migration
  def change
    create_table :craigslist_lookups do |t|
      t.integer :zip
      t.string  :zip_name
      t.string  :craigslist_subdomain
    end
  end
end
