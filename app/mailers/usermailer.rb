class Usermailer < ActionMailer::Base
  default from: "patroll.app@gmail.com"
  layout 'mailer'

  def gmail_message
    mail(to:'adriana.lcs316@gmail.com', subject: 'test email')
    # subject 'Message via Gmail'
    # recipients 'adriana.lcs316@gmail.com'
    # from 'patroll.app@gmail.com'
    # sent_on Time.now
  end
end
