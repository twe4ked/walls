class StatusesController < BasePostController
  actions :create, :destroy, :show
  belongs_to :wall
  
  private

  def collection_url
    request.referrer || root_path
  end
end
