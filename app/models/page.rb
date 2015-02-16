class Page < ActiveRecord::Base
  searchable do
    string :base_url, :stored =>true
    text :body, :stored =>true
  end
#  handle_asynchronously :solr_index

end
