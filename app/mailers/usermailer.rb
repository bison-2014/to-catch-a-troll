class Usermailer < ApplicationMailer
  def deliver_gmail_message
    subject 'Message via Gmail'
    recipients 'patroll.app@gmail.com'
    from 'patroll.app@gmail.com'
    sent_on Time.now
  end
end
