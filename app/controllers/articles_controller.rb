class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end
  def create
    @article = Article.create(article_params)
     if @article.save
      flash[:success] = 'Article Successfully created'
      redirect_to @article # we need to pass in an 'id' bcos of the URI '/users/:id'
    else
      render action: :new

    end
  end
  private
  def article_params
    params.require(:article).permit(:title,:text)
  end
  
end
