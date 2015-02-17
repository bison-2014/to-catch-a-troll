class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :base_url
      t.text :body

      t.timestamps null: false
    end
  end
end
