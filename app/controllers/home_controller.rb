class HomeController < ApplicationController
  def index
    @token = params[:token]
  end
end
