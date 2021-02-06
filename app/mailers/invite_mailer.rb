class InviteMailer < ApplicationMailer

  def send_mail(team)
    @team = team
    mail to: "@team.email", subject: "PTAアプリ＝チームへの招待メール＝"
  end
end
