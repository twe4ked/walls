class StatusesController < BasePostController
  actions :create, :destroy, :show, :index

  private

  def collection_url
    request.referrer || root_path
  end

  def end_of_association_chain
    super.includes(:user, :comments => :user)
  end
end
