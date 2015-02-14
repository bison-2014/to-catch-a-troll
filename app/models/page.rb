class Page < ActiveRecord::Base
  searchable do
    text :base_url
    text :body
  end
end
