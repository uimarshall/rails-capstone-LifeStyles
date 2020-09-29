class ArticlesController < ApplicationController
    # before_action :set_article, only: %i[show destroy create]
    

  def index
    # @articles = Article.all
    @articles = Article.all
    @featured = Article.featured_article
    @categories = Category.order(:priority).limit(4).includes(:articles)
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end
  def create
    # @article = Article.create(article_params)
    # Ensure we have the user filling out the form
    @user = User.find(params[:user_id])
    @article = @user.articles.build(article_params)
   
     if @article.save
      flash[:success] = 'Article Successfully created'
      redirect_to @article # we need to pass in an 'id' bcos of the URI '/users/:id'
    else
      render action: :new

    end
  end
   def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
  end
  private
  #  def set_article
  #   @article = Article.find(params[:id])
  # end
  def article_params
    params.require(:article).permit(:title,:text, :category_id, :avatar)
  end
  
end
