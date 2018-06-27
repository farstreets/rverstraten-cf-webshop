class UserMailer < ApplicationMailer
  default from: "rp.verstraten@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: 'rp.verstraten@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Rubber Duck Debug"
    mail(to: user.email,
         subject: "Welcome to #{@appname}!")
  end

end
