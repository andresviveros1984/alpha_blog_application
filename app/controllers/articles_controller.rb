class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        # binding.pry
      @articles = Article.all
    end

    def new
      @article = Article.new      
    end

    def edit
      @article = Article.find(params[:id])
    end

    def create
        
      @article = Article.new(params.require(:article).permit(:title, :description))
      if(@article.save)
        flash[:notice] ="Article saved successfully" #=>to print message if save successfully
        redirect_to article_path(@article)
        # redirect_to @article => alternative sytanx to above
      else
        render 'new'
      end
    end

   def update
      @article = Article.find(params[:id]) 
      if(@article.update(params.require(:article).permit(:title, :description)))
        flash.notice ="Update of article successfull"
        redirect_to @article
      else
        render 'edit'
      end
   end

   

end