class Page < ActiveRecord::Base
  searchable do
    string :base_url
    text :body
  end
end