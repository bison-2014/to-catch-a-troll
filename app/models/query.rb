class Query < ActiveRecord::Base
  def new
    @query = Query.new(url: params[:url])
  end

  def edit
    @query = Query.find(params[:query_id])
    cobweb = Cobweb.new
    Resque.enqueue(TaskWorker, @query.id)
    redirect_to @query, notice: "Successful response to query"
  end

  def show
    @query = Query.find(params[:id])
  end

end