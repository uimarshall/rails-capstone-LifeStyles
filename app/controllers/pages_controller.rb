class PagesController < ApplicationController
  def home
   
    @categories= Category.all
    cat = params[:cat]
    if !cat.nil?
      @articles = Article.where(:category_id => cat)
    else

     @articles = Article.all  
    end
    
  end
end
