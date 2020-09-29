class PagesController < ApplicationController
  def home
    @categories = Category.all
    cat = params[:cat]
    @articles = if !cat.nil?
                  Article.where(category_id: cat)
                else

                  Article.all
                end
  end
end
