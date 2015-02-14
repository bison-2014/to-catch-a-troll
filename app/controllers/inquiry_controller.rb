class InquiryController < ApplicationController
  def new
    @inquiry = Inquiry.new(url: url, search_string: search_string, recursion_depth: 0)
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
    redirect_to @inquiry_path
  end

end