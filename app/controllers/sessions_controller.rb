class SessionsController < ApplicationController
	def new
		
	end

	def create		
		account = Account.find_by_username(params[:username])
		if account && account.authenticate(params[:password])
			session[:account_id] = account.id
			redirect_to statusupdates_path, :notice => "Logged in"
		else	
			flash.now.alert = "Invalid username or password"
			render "new"
		end
	end

	def destroy
		session[:account_id] = nil
		redirect_to new_session_path, :notice => "Logged out!"
	end
end
