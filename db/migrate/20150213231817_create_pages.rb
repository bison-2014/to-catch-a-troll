class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :base_url
      t.text :body
    end
  end
end
