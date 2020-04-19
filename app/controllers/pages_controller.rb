class PagesController < ApplicationController
    #before_action :set_page, except: [:index, :new, :create]
    #or even better, so that whenever you add a method you dont need it, you dont have to worry about adding to the list above:
    before_action :set_page, only: [:show, :edit, :update, :destroy]
    def index
       @pages = Page.all
    end
    
    
    def show
       #set_page# @page =Page.find(params[:id])
      #  render text: @page.title   --> RAils only renders one thing per controller action
    end
    
    def new
       @page=Page.new  #this will take you to the new.html.erb in views
    end
    
    def create
        @page =Page.new(page_params)
        @page.save
        redirect_to @page
    end
    
    def edit
       #set_page#@page =Page.find(params[:id]) 
    end
    
    def update
       #set_page#@page =Page.find(params[:id])
       @page.update(page_params)
       redirect_to @page
    end
    
    def destroy
       #set_page #  @page =Page.find(params[:id])
       @page.destroy
       redirect_to @page
    end
    
    
    
     private
    
      def page_params
        params.require(:page).permit(:title, :body, :slug)
      end
      
      def set_page
          @page =Page.find(params[:id])
      end
  
end
