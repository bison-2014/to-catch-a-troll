class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string     :url
      t.string     :search_strings
      t.integer    :recursion_depth
      t.belongs_to :user
    end
  end
end
