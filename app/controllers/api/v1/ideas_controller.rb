class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    respond_with Idea.all
  end

  def show

  end

  def create

  end

  def update

  end

  def destroy

  end
end
