class WallsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @walls = Wall.all
  end
  
  def show
    @wall = begin
      Wall.find params[:id]
    rescue ::ActiveRecord::RecordNotFound
      nil
    end
    @statuses = @wall && @wall.statuses.includes(:user, :comments => :user)
  end
  
  def new
    @wall = Wall.new(:slug => params[:slug])
  end
  
  def create
    @wall = Wall.new(params[:wall])
    
    respond_to do |format|
      if @wall.save && @wall.moderators.create!(:user => current_user)
        format.html { redirect_to(@wall, :notice => 'Wall was successfully created.') }
      else
        format.html { render :action => "new", :alert => 'Wall was not created.' }
      end
    end
  end
  
end
