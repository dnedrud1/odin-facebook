class UserMailer < ActionMailer::Base
  default from: "friendbook_noreply@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @name = user.name
    @email = user.email

    mail to: @email
  end
end
