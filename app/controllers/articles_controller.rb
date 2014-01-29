class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def article_params
    params.require(:article).permit(:title,:body)
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path, notice => "Your new article has been created"
    else
      render "new"
    end

  end


  def edit
    @article = Article.find(params[:id])
  end

  def update

    @article = Article.find(params[:id])

    if @article.update_attributes(article_params)
      redirect_to articles_path, :notice => "You have updated the article"
    else
      render "edit"
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path, :notice => "You have deleted the article"

  end


end
