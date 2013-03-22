class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private

  def current_user
    @current_user ||= Account.find_by(_id: session[:account_id]) if session[:account_id]
    #@current_user = Account.find_by(_id: session[:account_id])
  end
end
