class InviteMailer < ApplicationMailer
  def send_mail(team)
    @team = team
    mail to: "user.email", subject: "PTAアプリ・シェアータスクのチーム参加への招待です"
  end
end
