class ApplicationMailer < ActionMailer::Base
  default from: 'ruben.verstraten@gmail.com'
  layout 'mailer'
  # def mailer(user)
  #   @user = user
  #   mail(to: @user.email, subject: 'Sample Email')
  # end
end
