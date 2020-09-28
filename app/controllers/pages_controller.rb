class PagesController < ApplicationController
  def home
    @articles = Article.all
  end
end
