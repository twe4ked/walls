class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => :create
  
  # POST /statuses
  def create
    status = Status.find(params[:status_id])
    @comment = status.comments.new(params[:comment].merge(:user => current_user))
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(root_path, :notice => 'Comment was successfully created.') }
      else
        format.html { redirect_to(root_path, :alert => 'Comment was not created.') }
      end
    end
  end

  # DELETE /statuses/1
  def destroy
    @comment = Comment.find(params[:id])
    
    unless @comment.user == current_user
      redirect_to(statuses_path, :alert => 'Comment was not deleted.') && return
    end
    
    @comment.destroy
    redirect_to(statuses_url, :notice => 'Comment was successfully deleted')
  end
end
