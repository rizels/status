class StatusupdatesController < ApplicationController

	def index
		authorize! :read, @account		
		if session[:account_id] != nil
			@account = Account.find_by(_id: session[:account_id])
			if @account.role == "admin"
				@statusupdates = Statusupdate.unscoped.order_by([:updatetime, :desc]).page(params[:page]).per(5)
			else
				@statusupdates = Statusupdate.order_by([:updatetime, :desc]).page(params[:page]).per(3)
			end
			@statusupdate = Statusupdate.new									
		else
			redirect_to new_session_path
		end
	end

	def show	    
		@account = Account.find_by(_id: session[:account_id])
		@statusupdate = Statusupdate.unscoped.find_by(_id: params[:id])
		authorize! :read, @statusupdate# if @account && @account.role != 'admin' && @statusupdate && @statusupdate.deleted_at != nil 
		@comments = @statusupdate.comments.page(params[:page]).per(3)
		if @account.role == "admin"
			@comments = @statusupdate.comments.unscoped.page(params[:page]).per(3)
		else
			@comments = @statusupdate.comments.page(params[:page]).per(3)
		end
	end

	def new
		@statusupdate = Statusupdate.new
	end

	def create
		@account = Account.find_by(_id: session[:account_id])
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
		@account = Account.find_by(_id: session[:account_id])
		@statusupdate = Statusupdate.find_by(_id: params[:id])
		authorize! :read, @account unless @account.username == @statusupdate.username
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
