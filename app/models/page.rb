class Page < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper

  belongs_to :target

  searchable do
    string :base_url
    text   :body, :stored =>true do
      strip_tags(body)
    end
    integer   :target_id, :references => Target
  end
#  handle_asynchronously :solr_index

end
