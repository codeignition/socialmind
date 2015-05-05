class SocialAccountsController < ApplicationController
  before_action :set_social_account, only: [:show, :edit, :update, :destroy]

  def index
    @social_accounts = SocialAccount.all
  end

  def show
  end

  def destroy
    @social_account.destroy
    respond_to do |format|
      format.html { redirect_to social_accounts_url, notice: 'Social account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_social_account
      @social_account = SocialAccount.find(params[:id])
    end

    def social_account_params
      params[:social_account]
    end
end
