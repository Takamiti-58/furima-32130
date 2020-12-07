class ArticlesController < ApplicationController
  authenticate_user!
  def index
    @articles = Article.order("created_at DESC")
  end

  def new
  end
end
