class SearchWorker
  @queue = :search_queue

  def self.perform
    @queries = SearchQuery.all

    @queries.each do |query|
      # user_terms = query.search_array 

      # @usersearch = Page.search do
      #   p "it's working"
      #   fulltext user_terms
      #   if @usersearch.hits
      #     p 'solr is searching'
      #   end 
      # end

      searcher = UserPageSearch(query: query)
      usersearch = searcher.search

      if usersearch.hits
        Rails.logger.info "UserPageSearch hits!"
        # send email
      else
        Rails.logger.info "UserPageSearch miss ..."
      end
    end
   
  end

end 