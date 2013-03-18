class StatusupdatesController < ApplicationController
	def index
		if session[:account_id] != nil
			@statusupdates = Statusupdate.all
			@statusupdate = Statusupdate.new		
			@account = Account.find(session[:account_id]) if session[:account_id]			
		else
			redirect_to new_session_path
		end

	end

	def show
		@statusupdate = Statusupdate.find(params[:id])
		@account = Account.find(session[:account_id]) if session[:account_id]
	end

	def new
		@statusupdate = Statusupdate.new
	end

	def create
		@account = Account.find(session[:account_id])
		@statusupdate = Statusupdate.new(params[:statusupdate])
		@statusupdate.username = @account.username
		@statusupdate.updatetime = Time.now

		if @statusupdate.save
			redirect_to statusupdates_path, :notice => "Your Status has been updated"
		else
			render "new"
		end
	end

	def edit
		@account = Account.find(session[:account_id])
		@statusupdate = Statusupdate.find(params[:id])
		authorize! :all, @statusupdate unless @statusupdate.username == @account.username
	end

	def update
		@account = Account.find(session[:account_id])
		@statusupdate = Statusupdate.find(params[:id])
		if @statusupdate.update_attributes(params[:statusupdate])
			redirect_to statusupdates_path, :notice => "Your Status has been edited"
		else
			render "edit"
		end
	end

	def destroy
		@statusupdate = Statusupdate.find(params[:id])
		@statusupdate.destroy
		redirect_to statusupdates_path, :notice => "Your Status has been deleted"
	end
end
