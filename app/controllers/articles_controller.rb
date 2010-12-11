class ArticlesController < ApplicationController
  before_filter :authenticate_admin, :except => [:show,:index]
  before_filter :load_article, :only => [:show,:edit,:update,:destroy]
  before_filter :load_sidebar

  def index
    @articles = Article.desc(:created_at)
  end

  def new
    @article = Article.new
    @articles = Article.all
  end

  def create
    redirect_to articles_path and return if params[:commit] == "Cancel"
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article, :notice => created(:article)
    end
  end

  def show
    @parent = Article.where(:child_id => @article.id).first
    @child = @article.child
  end

  def edit
    @articles = Article.all.reject{|e| e==@article}    
  end

  def update
    redirect_to articles_path and return if params[:commit] == "Cancel"    
    if @article.update_attributes(params[:article])
      redirect_to article_path(@article,:anchor=>"main"), :notice => updated(:article)
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, :notice => deleted(:article)
  end

  private

    def load_article; @article = Article.where(:slug => params[:id]).first end
    def load_sidebar
      @sidebar = true
      @latest_article = Article.last
      @latest_notice = Notice.last
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
