# Articles Controller
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def create
    # debugger
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = 'article was successufully saved!'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def destroy
    if @article.destroy
      flash[:danger] = 'article was successfully deleted'
      redirect_to articles_path
    else
      render 'articles'
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = 'article updated!'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
