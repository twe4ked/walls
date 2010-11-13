class BasePostController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:show, :index]
  actions :all, :except => [:edit, :update]

  def create
    create! :location => collection_url do |success, failure|
      failure.html do
        flash[:alert] = "#{resource_class.human_name} was not created."
        redirect_to collection_url
      end
    end
  end

  private

  def set_creator
    params[resource_instance_name][:user_id] = current_user.id
  end
  before_filter :set_creator, :only => :create

  def prevent_destroy_others
    unless resource.user_id == current_user.try(:id)
      redirect_to collection_url, :alert => "You don't have permission to delete this #{resource_class.model_name.human.downcase}."
      return false
    end
  end
  before_filter :prevent_destroy_others, :only => :destroy

end
