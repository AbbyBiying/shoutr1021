class UserMailer < ActionMailer::Base
  def follow_notification(user, follower)
    @follower = follower
    mail(to: user.email, subject: "you have a new follower.")
  end
end
