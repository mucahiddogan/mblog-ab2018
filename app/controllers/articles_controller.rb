class ArticlesController < ApplicationController

     # before_action :find_article, only:, [:show, :destroy]
     before_action :find_article, only: %i[show destroy edit update]

     http_basic_authenticate_with name: "mchd", password: "bos", except: [:index, :show]

     def new
          @article = Article.new
     end

     def index
          @articles = Article.all

          respond_to do |format|
               format.html
               format.json { render json: @articles }
          end
     end

     def show
          # @article = Article.find(params[:id])
     end

     def create
            # render plain: params[:article].inspect
             @article = Article.new(article_params)


          if  @article.save
               redirect_to @article
          else
               render 'new'
          end
     end

     def edit
          # @article = Article.find(params[:id])

     end

     def update
          # @article = Article.find(params[:id])

          if @article.update(article_params)
               redirect_to @article
          else
               render 'edit'
          end
     end

     def destroy
          # @article = Article.find(params[:id])

          @article.destroy

          redirect_to articles_path
     end

     private

          def find_article
               @article = Article.find(params[:id])
          end

          def article_params
               params.require(:article).permit(:title, :text)
          end

end
