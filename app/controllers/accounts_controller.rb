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
		
		#account = @current_user
	end

	def update
		if @current_user.update_attributes(params[:account])
			redirect_to statusupdates_path, :notice => "Your Profile has been edited"
		else
			raise @current_user.errors.full_messages.inspect
			render "edit", :notice => "Your Profile has been edited"
		end
	end
end
