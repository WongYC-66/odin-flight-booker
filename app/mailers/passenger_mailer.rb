class PassengerMailer < ApplicationMailer
  default from: "odin_flight@example.com"

  def welcome_email
    @user = params[:user]
    @flight = params[:flight]
    @all_passengers = params[:all_passengers]
    mail(to: @user.email, subject: "Ticket booking - Successful")
  end
end
