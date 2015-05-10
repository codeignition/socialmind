class InvitationMailer < ApplicationMailer
  def invite invitation
    @invitation = invitation
    mail(to: invitation.email, subject: 'invitation')
  end
end
