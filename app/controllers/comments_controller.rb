class CommentsController < BasePostController
  actions :create, :destroy
  belongs_to :status

  private

  def collection_url
    request.referrer || root_path
  end
end
