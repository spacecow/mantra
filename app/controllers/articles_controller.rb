class ArticlesController < ApplicationController
  before_filter :authenticate_admin, :except => [:show,:index]
  before_filter :load_article, :only => [:show,:edit,:update,:destroy]

  def index
    @articles = Article.asc(:created_at)
  end

  def new
    @article = Article.new
  end

  def create
    redirect_to articles_path and return if params[:commit] == "Cancel"
    @article = Article.new(params[:article])
    if @article.save
      redirect_to articles_path, :notice => created(:article)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update_attributes(params[:article])
      redirect_to @article, :notice => updated(:article)
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, :notice => deleted(:article)
  end

  private

    def load_article
      @article = Article.where(:slug => params[:id]).first
    end

    def authenticate_admin
      if !user_signed_in?
        flash[:alert] = t('devise.failure.unauthenticated')
        redirect_to new_user_session_path
      elsif current_user.email != "jsveholm@gmail.com"
        flash[:alert] = t('You do not have access to that page')
        redirect_to new_user_session_path
      end
    end
end
