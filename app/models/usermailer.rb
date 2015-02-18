class Usermailer < ActiveRecord::Base
  def deliver_gmail_message
    subject 'Message via Gmail'
    recipients 'adriana.lcs316@gmail.com'
    from 'patroll.app@gmail.com'
    sent_on Time.now
  end
end
