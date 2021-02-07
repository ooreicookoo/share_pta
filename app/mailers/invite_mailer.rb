class InviteMailer < ApplicationMailer
  def send_mail(team)
    @team = team.id
    mail(
      subject: "PTAアプリ・チームへの招待メール",
      to: @team
    ) do |format|
      format.text
    end
  end
end
