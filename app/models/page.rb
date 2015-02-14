class Page < ActiveRecord::Base
  searchable do
    text :title
    text :body
  end
end
