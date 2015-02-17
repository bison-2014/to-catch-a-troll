class Page < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper

  searchable do
    string :base_url
    text :body, :stored =>true do
      strip_tags(body)
    end
  end
#  handle_asynchronously :solr_index

end
