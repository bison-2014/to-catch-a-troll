class Page < ActiveRecord::Base
  searchable do
    string :base_url
    text :body
  end

#  handle_asynchronously :solr_index
end