class InvitationMailer < ApplicationMailer
  def invite invitation
    @invitation = invitation
    mail(to: invitation.email, subject: "#{@invitation.host.name}, has invited you to tweet from #{@invitation.social_account.nickname} on Socialmind")
  end
end
