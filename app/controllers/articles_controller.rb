class ArticlesController < ApplicationController
  include ActionController::Serialization
  before_action :set_article, only: %i[show destroy]
  before_action :current_user

  def index
    @articles = Article.all
    @featured = Article.featured_article
    @categories = Category.order(:priority).limit(4).includes(:articles)
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = @current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        # Create article-categories using the category_id and article_id saved
        ArticleCategory.create(category_id: article_params[:category_id], article_id: @article.id)
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        article_category = ArticleCategory.where(article_id: @article.id)
        article_category[0].category_id = article_params[:category_id]
        article_category[0].save
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image, :category_id)
  end
end
