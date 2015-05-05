class SocialAccountsController < ApplicationController
  def destroy
    @social_account = SocialAccount.find(params[:id])
    @social_account.destroy
    respond_to do |format|
      format.html { redirect_to user_root_url, notice: 'Social account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
