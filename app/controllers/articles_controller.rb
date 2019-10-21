class ArticlesController < ApplicationController
    def index #Show all articles in a list
        @articles = Article.all
    end

    def show #Show Articles by id
        @article = Article.find(params[:id])
    end

    def new #Show the new article Form
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else #if is an invalid articles arguments, return to new form with the fields filled
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
