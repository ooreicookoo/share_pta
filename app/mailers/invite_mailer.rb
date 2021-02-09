class InviteMailer < ApplicationMailer
  def send_mail(team, email)
    @team = team
    mail(to: email, subject: "PTAアプリ・シェアータスクのチーム参加への招待です")
  end
end
