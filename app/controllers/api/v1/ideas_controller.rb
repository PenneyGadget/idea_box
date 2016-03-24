class Api::V1::IdeasController < Api::V1::BaseController
  respond_to :json

  def index
    respond_with Idea.all
  end

  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      respond_with :api, :v1, @idea
    end
  end

  def update
    respond_with Idea.update(params[:id], idea_params)
  end

  def destroy
    respond_with Idea.find(params[:id]).destroy
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :quality)
  end
end
