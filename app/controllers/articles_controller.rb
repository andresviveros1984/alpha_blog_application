class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        # binding.pry
      @articles = Article.all
    end

    def new
      @article = Article.new      
    end

    def edit
      
    end

    def create
      @article = Article.new(article_params)
      if(@article.save)
        flash[:notice] ="Article saved successfully" #=>to print message if save successfully
        redirect_to article_path(@article)
        # redirect_to @article => alternative sytanx to above
      else
        render 'new'
      end
    end

   def update
      if(@article.update(article_params))
        flash.notice ="Update of article successfull"
        redirect_to @article
      else
        render 'edit'
      end
   end

   def destroy
     @article.destroy
     redirect_to articles_path
   end

   private

   def set_article
      return @article = Article.find(params[:id])
   end
   
   def article_params
      return params.require(:article).permit(:title, :description)
   end

end