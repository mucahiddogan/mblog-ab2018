class LanguagesController < ApplicationController
     def show
          @language = params[:language]
          puts params[:language]
     end

     def product_params
          params.require(:language).permit[:language]
     end

end
