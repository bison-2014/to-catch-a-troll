class CreateQuery < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :url
      t.string :response
    end
  end
end
