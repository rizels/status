class CommentsController < ApplicationController
  def new    
    @comment = Comment.new
  end

  def create
    @account = Account.find_by(_id: session[:account_id])
    @statusupdate = Statusupdate.find_by(_id: params[:statusupdate_id])
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
    @comments = @statusupdate.comments.order_by([:created_at, :asc]).page(params[:page]).per(3)
  end

  def show
    @account = Account.find_by(_id: session[:account_id])
    @statusupdate = Statusupdate.find_by(_id: params[:statusupdate_id])
    @comment = @statusupdate.comments.unscoped.find_by(_id: params[:id])
    authorize! :read, @comment #if @account && @account.role != 'admin' && @comment && @comment.deleted_at != nil 

  end

  def edit
    @account = Account.find(session[:account_id])
    @statusupdate = Statusupdate.find_by(_id: params[:statusupdate_id])
    @comment = @statusupdate.comments.find_by(_id: params[:id])
    authorize! :read, @account unless @comment && @comment.commenter == @account.username
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
