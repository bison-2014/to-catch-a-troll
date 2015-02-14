class Inquiry < ActiveRecord::Base
  belongs_to :user

  def execute
    c = Cobweb.new
    Page.new()
  end

end
