class WallsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @walls = Wall.all
  end
  
  def show
    @wall = Wall.find(params[:id])
  end
  
  def new
    @wall = Wall.new(:slug => params[:slug])
  end
  
  def create
    @wall = Wall.new(params[:wall])
    
    respond_to do |format|
      if @wall.save
        format.html { redirect_to(root_path, :notice => 'Wall was successfully created.') }
        # TODO: redirect to newly created wall /w/foobar
      else
        format.html { render :action => "new", :alert => 'Wall was not created.' }
      end
    end
  end
  
end
