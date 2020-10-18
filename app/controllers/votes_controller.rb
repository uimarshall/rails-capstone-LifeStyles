class VotesController < ApplicationController
  before_action :current_user

  def create
    @article = Article.find_by(id: params[:article_id])
    if @current_user.votes.exists?(article_id: params[:article_id])
      flash[:alert] = 'You have already voted for this article!'
    else

      @vote = @current_user.votes.new(article_id: params[:article_id])

      if @vote.save
        # redirect_to :back, notice: 'You voted for an article'
        redirect_to @article, notice: 'You voted for an article'
        # render @article
      else
        redirect_to request.referrer, alert: 'You unvoted an article'
      end

    end
  end

  def destroy
    @vote = Vote.find_by(id: params[:id], user: @current_user, article_id: params[:article_id])

    if @vote.destroy
      redirect_to request.referrer, notice: 'You unvoted an article'
    else
      redirect_to request.referrer, alert: 'Cannot unvote without voting first!'
    end
  end
end
