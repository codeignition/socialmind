class HomeController < ApplicationController
  layout nil
  def index
    @token = params[:token]
  end
end
