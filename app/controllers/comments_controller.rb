class CommentsController < ApplicationController
  def create
    @account = Account.find(session[:account_id])
    @statusupdate = Statusupdate.find(params[:statusupdate_id])
    #@comment = @statusupdate.comments.create(params[:comment])
    @comment = @statusupdate.comments.new(params[:comment])
    @comment.commenter = @account.username
    if @comment.save
      redirect_to statusupdate_path(@statusupdate), :notice => "Comment berhasil!"
    else
      redirect_to statusupdate_path(@statusupdate), :notice => "Comment Gagal!"
    end    
  end

  def destroy
  	@statusupdate = Statusupdate.find(params[:statusupdate_id])
  	@comment = @statusupdate.comments.find(params[:id])
  	@comment.destroy
  	redirect_to statusupdate_path(@statusupdate)
  	
  end
end
