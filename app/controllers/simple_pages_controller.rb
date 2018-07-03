class SimplePagesController < ApplicationController

  def index
  end

  def landing_page
    @featured_product = Product.first
    # @products = Product.all
    @products = Product.limit(5)
  end

  def debug_session
    @product = Product.find(params[:id])
    # notice: "Good luck!"
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    # ActionMailer::Base.mail(from: @email,
    # to: 'rp.verstraten@gmail.com',
    # subject: "A new contact form message from #{@name}",
    # body: @message).deliver_now
    UserMailer.contact_form(@email, @name, @message).deliver_now
    redirect_to root_url, notice: "Thank you. We have received your message and will respond as soon as possible."
  end

end
