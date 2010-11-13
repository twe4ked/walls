class StatusesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  # GET /statuses
  def index
    @statuses = Status.order 'statuses.created_at DESC'
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
    @status = Status.new(params[:status])

    respond_to do |format|
      if @status.save
        format.html { redirect_to(statuses_path, :notice => 'Status was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # DELETE /statuses/1
  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to(statuses_url) }
      format.xml  { head :ok }
    end
  end
end
