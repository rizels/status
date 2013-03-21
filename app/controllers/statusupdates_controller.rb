class StatusupdatesController < ApplicationController
	def index
		if session[:account_id] != nil
			@account = Account.find(session[:account_id]) if session[:account_id]
			if @account.role == "admin"
				@statusupdates = Statusupdate.order("updatetime DESC").with_deleted.page(params[:page]).per(5)
			else
				@statusupdates = Statusupdate.order("updatetime DESC").page(params[:page]).per(5)
			end
				@statusupdate = Statusupdate.new									
		else
			redirect_to new_session_path
		end

	end

	def show	    
		@statusupdate = Statusupdate.find(params[:id])
		@account = Account.find(session[:account_id]) if session[:account_id]
		if @account.role == "admin"
			@comments = Statusupdate.find(params[:id]).comments.with_deleted.page(params[:page]).per(3)
		else
			@comments = Statusupdate.find(params[:id]).comments.page(params[:page]).per(3)
		end
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
			render "edit", :notice => "Error edited status"
		end
	end

	def destroy
		@statusupdate = Statusupdate.find(params[:id])
		@statusupdate.destroy
		redirect_to statusupdates_path, :notice => "Your Status has been deleted"
	end
	
	def recovery
		
	end
end
