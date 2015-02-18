class UserPageSearch 
  attr_reader :user 
  attr_reader :query

  def initialize(args)
    @query = args[:query]
    @user = args[:user] || @query.try(:user)
  end

  def search(targets = [])
    @query ||= SearchQuery.find_by(user_id: user.id)
    user_terms = @query.search_array if @query

    if user_terms
      usersearch = Page.search do
        with(:target_id).any_of(targets) if targets.any?
        fulltext user_terms do
          highlight :body
        end
      end
    end

    usersearch
  end
end