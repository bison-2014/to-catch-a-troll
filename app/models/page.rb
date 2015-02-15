class Page < ActiveRecord::Base
  searchable do
    string :base_url
    text :body, :boost => 2.0
  end
#  handle_asynchronously :solr_index
end
