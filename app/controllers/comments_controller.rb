class CommentsController < ApplicationController
  def new    
    @comment = Comment.new
  end

  def create
    @account = Account.find(session[:account_id])
    @statusupdate = Statusupdate.find(params[:statusupdate_id])
    @comment = @statusupdate.comments.new(params[:comment])
    @comment.commenter = @account.username
    if @comment.save
      redirect_to statusupdate_path(@statusupdate), :notice => "Comment berhasil!"
    else
      redirect_to statusupdate_path(@statusupdate), :notice => "Comment Gagal!"
    end    
  end

  def index
    @account = Account.find(session[:account_id])
    @statusupdate = Statusupdate.find(params[:statusupdate_id])
    @comments = @statusupdate.comments.all#order("id DESC").page(params[:page]).per(3)
  end

  def show
    @account = Account.find(session[:account_id])
    @statusupdate = Statusupdate.find(params[:statusupdate_id])
    @comment = @statusupdate.comments.find(params[:id])
  end

  def edit
    @account = Account.find(session[:account_id])
    @statusupdate = Statusupdate.find(params[:statusupdate_id])
    @comment = @statusupdate.comments.find(params[:id])
  end

  def update
    @statusupdate = Statusupdate.find(params[:statusupdate_id])
    @comment = @statusupdate.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to statusupdate_path(@statusupdate), :notice => "Comment Successfull edited"
    else
      render "edit", :notice => "Error edited status"
    end
  end


  def destroy
  	@statusupdate = Statusupdate.find(params[:statusupdate_id])
  	@comment = @statusupdate.comments.find(params[:id])
  	@comment.destroy
  	redirect_to statusupdate_path(@statusupdate)
  	
  end
end
