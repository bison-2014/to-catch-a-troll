class CreateUsermailers < ActiveRecord::Migration
  def change
    create_table :usermailers do |t|

      t.timestamps null: false
    end
  end
end
