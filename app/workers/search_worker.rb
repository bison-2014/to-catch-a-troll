class SearchWorker
  @queue = :search_queue

  def self.perform
    @queries = SearchQuery.all

    @queries.each do |query|

      searcher = UserPageSearch(query: query)
      usersearch = searcher.search

      if usersearch.hits

        puts"IT'S GETTING TO EMAILS========"
        @user= User.find_by(id: query.user_id)
        Rails.logger.info "UserPageSearch hits!"
        Usermailer.gmail_message(@user).deliver_now
        # send email
      else
        Rails.logger.info "UserPageSearch miss ..."
      end
    end
   
  end

end 