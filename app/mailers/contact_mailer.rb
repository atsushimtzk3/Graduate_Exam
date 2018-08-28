class ContactMailer < ApplicationMailer
  def contact_mail(user)
    @user = user
    mail(to: "comcheo.biz@gmail.com", bcc: user.email, subject: '応援募集')
  end
end
