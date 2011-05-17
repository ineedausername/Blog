class CommentsController < ApplicationController

  def create
    @author = Author.find params[:author_id]
    @article = @author.articles.find params[:article_id]
    @comment = @article.comments.build( :email        => params[:email],
                                        :body         => params[:body],
                                        :comment_date => Time.now)
    @comment.save
    
    respond_to do | format | 
      format.html {redirect_to author_article_path(@author, @article)}
      format.js
    end
  end

  def edit
    @author = Author.find params[:author_id]
    @article = @author.articles.find params[:article_id]
    @comment = @articles.comments.find params[:id]
  end

  def update
    @author = Author.find params[:author_id]
    @article = @author.articles.find params[:article_id]
    @comment = @article.comments.find params[:id]
    if @comment.update_attributes(params[:comment])
      redirect_to author_article_path(@author, @article)
    else
     render :action => "new" 
    end
  end

  def destroy
    @author = Author.find params[:author_id]
    @article = @author.articles.find params[:article_id]
    @comment = @article.comments.find params[:id]
    @comment.destroy
      redirect_to author_article_path(@author, @article)
  end
end
