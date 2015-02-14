class Inquiry < ActiveRecord::Base
  def new
    @inquiry = Inquiry.new(url: params[:url])
    if @inquiry.save
      redirect_to @inquiry
    else
      redirect :back, notice: "Could not save your inquiry"
    end
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
    Resque.enqueue(TaskWorker, @inquiry.id)
    puts "Successful response to Inquiry"
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

end