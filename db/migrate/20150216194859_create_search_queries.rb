class CreateSearchQueries < ActiveRecord::Migration
  def change
    create_table :search_queries do |t|
      t.belongs_to :user
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :zipcode
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
