class HomeController < ApplicationController
     skip_before_action :verify_authenticity_token
    def index
        
    end
    def login
        
    end
    def login_post
        session[:user_id]=User::find(1)
       
        session[:user_name]= User::find(1).username
        session[:id]= User::find(1).id
       redirect_to :controller => 'home', :action => 'index'
      
    end
    
    
    
end
