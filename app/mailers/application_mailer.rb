class ApplicationMailer < ActionMailer::Base
  default from: 'rp.verstraten@gmail.com'
  layout 'mailer'
  # def mailer(user)
  #   @user = user
  #   mail(to: @user.email, subject: 'Sample Email')
  # end
end
