class StatusesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  # GET /statuses
  def index
    @statuses = Status.includes(:user, :comments => :user)
    @status = Status.new(params[:status])
  end

  # GET /statuses/1
  def show
    @status = Status.find(params[:id])
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # POST /statuses
  def create
    @status = Status.new(params[:status].merge(:user => current_user))

    respond_to do |format|
      if @status.save
        format.html { redirect_to(root_path, :notice => 'Status was successfully created.') }
      else
        # format.html { render :action => "new" }
        format.html { redirect_to(root_path, :alert => 'Status was not created.') }
      end
    end
  end

  # DELETE /statuses/1
  
  def destroy
    @status = Status.find(params[:id])
    
    unless @status.user == current_user
      redirect_to(root_path, :alert => 'Status was not deleted.') && return
    end
    
    @status.destroy
    redirect_to(root_path, :notice => 'Status was successfully deleted')
  end
end
