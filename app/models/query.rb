class Query < ActiveRecord::Base
  def new
    @query = Query.new
  end

  def edit
    @query = Query.find(params[:snippet_id])
    cobweb = Cobweb.new
    page = c.get(:url)
    file = File.new("output.html", "wb") { |f| f.write(page[:body])}
    @query.update_attributes(response: File.absolute_path(file))
    redirect_to @query, notice: "Successful response to query"
  end

end