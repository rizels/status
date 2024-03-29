class AccountsController < ApplicationController
	def new
		@account = Account.new
	end

	def create
		@account = Account.new(params[:account])
		if @account.save
			redirect_to new_session_path, :notice => "Signed up!"
		else
			render "new"
		end
	end

	def edit
		@account = Account.find(session[:account_id])		
	end

	def update
		@account = Account.find(session[:account_id])		
		if @account.update_attributes(params[:account])
	#	if @account.update_attribute(image, :img)
			redirect_to statusupdates_path, :notice => "Your Profile has been edited"
		else
			raise @account.errors.full_messages.inspect
			render "edit", :notice => "Your Profile has been edited"
		end
	end
end
